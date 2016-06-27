# Maintainer:  <skrylar@UFO>
pkgname=ams-lv2-git
pkgver=86
pkgrel=1
epoch=
pkgdesc="Alsa Modular modules in LV2 form."
arch=('i686' 'x86_64')
url="https://objectivewave.wordpress.com/ams-lv2/"
license=('GPL')
groups=()
depends=('gtkmm' 'gtk2' 'lvtk-git' 'fftw' 'cairo' 'lv2')
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("git+https://github.com/blablack/ams-lv2")
md5sums=('SKIP')
noextract=()

pkgver() {
  cd "${srcdir}/ams-lv2"
  git rev-list HEAD --count
}

prepare() {
  cd "${srcdir}/ams-lv2"
  ./waf configure --prefix=/usr
}

build() {
  cd "${srcdir}/ams-lv2"
  ./waf
}

package() {
  cd "${srcdir}/ams-lv2"
  ./waf install --destdir="$pkgdir/"
}

# vim:set ts=2 sw=2 et:
