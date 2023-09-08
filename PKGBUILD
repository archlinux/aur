# Maintainer : MorsMortium <morsmortium@disroot.org>

_pkgname=lbry-gtk
pkgname=${_pkgname}-git
pkgver=r492.6939df3
pkgrel=1
pkgdesc='Native desktop LBRY client'
arch=('x86_64')
url="https://codeberg.org/MorsMortium/${_pkgname}"
license=('GPL3')
depends=('python' 'python-gobject' 'python-cairo' 'gtk3' 'lbrynet' 'jansson' 'curl' 'md4c' 'pcre2' 'imagemagick' 'sqlite')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
makedepends=('git')
sha512sums=('SKIP')
source=("${pkgname}::git+${url}.git")

pkgver() {
  cd "${srcdir}/${pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
  cd "${srcdir}/${pkgname}"
  make
}

package() {
  cd "${srcdir}/${pkgname}"
  make install DESTDIR="${pkgdir}"
}
