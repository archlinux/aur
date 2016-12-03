# Maintainer: Gimmeapill <gimmeapill at gmail dot com>
_pkgbasename=fluidplug
pkgname=${_pkgbasename}-git
pkgver=r36.889b256
pkgrel=1
pkgdesc="SoundFonts as LV2 plugins via FluidSynth"
arch=('i686' 'x86_64')
url="https://github.com/falkTX/FluidPlug"
license=('CCPL')
depends=('lv2' 'fluidsynth')
makedepends=('git' 'wget')
provides=("${_pkgbasename}")
conflicts=("${_pkgbasename}")
source=("${_pkgbasename}::git://github.com/falkTX/FluidPlug.git")
sha256sums=('SKIP')

pkgver() {
		cd "${srcdir}/${_pkgbasename}"
		printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "${srcdir}/${_pkgbasename}"
	make DESTDIR=$pkgdir
}

package() {
  cd "${srcdir}/${_pkgbasename}"
  make DESTDIR="${pkgdir}" install
}
  

