# Maintainer : MorsMortium <morsmortium@gmail.com>

_pkgname=lbry-gtk
pkgname=${_pkgname}-git
pkgver=464.2100cf4
pkgrel=1
pkgdesc='Native desktop LBRY client'
arch=('any')
url="https://codeberg.org/MorsMortium/${_pkgname}"
license=('GPL-3.0')
depends=('python' 'python-gobject' 'python-cairo' 'gtk3' 'lbrynet' 'python-setproctitle' 'jansson' 'curl' 'md4c' 'pcre2' 'imagemagick' 'appdir' 'sqlite')
provides=("${_pkgname}")
makedepends=('git')
sha512sums=('SKIP')
source=("${pkgname}::git+${url}.git")

pkgver() {
  cd "${srcdir}/${pkgname}"
  printf "%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/${pkgname}"
  make
}

package() {
  cd "${srcdir}/${pkgname}"
  make install DESTDIR="${pkgdir}"
}
