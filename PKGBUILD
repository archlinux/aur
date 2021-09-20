# Maintainer: Héctor Molinero Fernández <hector at molinero dot dev>
# Contributor: Erazem Kokot <contact at erazem dot eu>
pkgname='hblock'
pkgver='3.2.3'
pkgrel='1'
pkgdesc='Adblocker that creates a hosts file from multiple sources'
arch=('any')
url='https://github.com/hectorm/hblock'
license=('MIT')
depends=('curl')
source=("https://github.com/hectorm/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('1b8eb3c5cb074cbe7b0a8b5e040641c12b519bee21a4a879e1bdd328cd17aa60')

check() {
  cd -- "${pkgname:?}-${pkgver:?}"
  make test
}

package() {
  cd -- "${pkgname:?}-${pkgver:?}"
  make DESTDIR="${pkgdir:?}" prefix="/usr" install
}
