# Maintainer: Icaro Perseo <icaroperseo[at]protonmail[dot]com>
# Contributor: FadeMind <fademind@gmail.com>

pkgname=papirus-color-scheme
_commit=3574833 # 7 digits
pkgver=20161203
pkgrel=1
pkgdesc="Papirus color scheme for KDE"
url="https://github.com/icaroperseo/${pkgname}"
arch=('any')
license=('GPL')
depends=('plasma-desktop')
makedepends=('git' 'make')
conflicts=('papirus-color-scheme-git')
options=('!strip')
source=("${pkgname}::git+${url}.git#commit=${_commit}")
sha256sums=('SKIP')

pkgver() {
  cd ${pkgname}
  git log -1 --format="%cd" --date=short | tr -d '-'
}

package() {
  cd ${pkgname}
  make install DESTDIR="$pkgdir"
}

# vim:set ts=2 sw=2 cc=80 et:
