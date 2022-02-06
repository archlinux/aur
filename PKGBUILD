# Maintainer: Gimmeapill <gimmeapill at gmail dot com>

pkgname=fluidplug-git
pkgver=r37.8457f10
pkgrel=1
pkgdesc="SoundFonts as LV2 plugins via FluidSynth"
arch=('i686' 'x86_64')
url="https://github.com/falkTX/FluidPlug"
license=('CCPL')
groups=('lv2-plugins')
depends=('fluidsynth')
makedepends=('git' 'wget' 'lv2' 'p7zip' 'fluidsynth')
provides=("${pkgname%-*}")
conflicts=("${pkgname%-*}")
source=("${pkgname%-*}::git+https://github.com/falkTX/FluidPlug.git")
sha256sums=('SKIP')

pkgver() {
	cd "${srcdir}/${pkgname%-*}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "${srcdir}/${pkgname%-*}"
	make DESTDIR=$pkgdir
}

package() {
	cd "${srcdir}/${pkgname%-*}"
	make DESTDIR="${pkgdir}" install
}
  

