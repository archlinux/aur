# Maintainer : MorsMortium <morsmortium@disroot.org>

_pkgname=lbry-gtk
pkgname=${_pkgname}-git
pkgver=r530.5a0432f
pkgrel=1
pkgdesc='Native desktop LBRY client'
arch=('x86_64')
url="https://codeberg.org/MorsMortium/${_pkgname}"
license=('GPL-3.0-or-later')
depends=('python' 'python-gobject' 'python-cairo' 'gtk3' 'lbrynet' 'jansson' 'curl' 'md4c' 'pcre2' 'imagemagick' 'sqlite' 'hicolor-icon-theme')
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
