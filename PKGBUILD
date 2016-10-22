# Maintainer: Icaro Perseo <icaroperseo[at]protonmail[dot]com>
# Contributor: FadeMind <fademind@gmail.com>

pkgname=papirus-kmail-theme
_commit=e9f86d0 # 7 digits
pkgver=20160615
pkgrel=1
pkgdesc="Papirus theme for KMail"
url="https://github.com/PapirusDevelopmentTeam/${pkgname}"
arch=('any')
license=('GPL')
depends=('kmail')
makedepends=('git' 'make')
conflicts=('papirus-kmail-theme-git')
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
