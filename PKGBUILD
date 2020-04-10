# Maintainer: Milk Brewster (milkii on Freenode)
# Contributor:  <skrylar@UFO>
pkgname=ams-mod-lv2-git
pkgver=176
pkgrel=1
epoch=
pkgdesc="Alsa Modular modules in LV2 form, MOD fork (0-10V range)."
arch=('i686' 'x86_64')
url="https://github.com/moddevices/ams-lv2"
license=('GPL')
groups=()
depends=('gtkmm' 'gtk2' 'lvtk' 'fftw' 'cairo' 'lv2')
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
# conflicts=('ams-lv2' 'ams-lv2-git')
replaces=()
# replaces=('ams-lv2' 'ams-lv2-git')
backup=()
options=()
install=
changelog=
source=("git+https://github.com/moddevices/ams-lv2#branch=change_ranges")
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
