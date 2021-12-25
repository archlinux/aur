# Maintainer: Héctor Molinero Fernández <hector at molinero dot dev>
# Contributor: Erazem Kokot <contact at erazem dot eu>
pkgname='hblock'
pkgver='3.3.0'
pkgrel='1'
pkgdesc='Adblocker that creates a hosts file from multiple sources'
arch=('any')
url='https://github.com/hectorm/hblock'
license=('MIT')
depends=('curl')
source=("https://github.com/hectorm/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('fe05755962812c98960955dd9461fc0e7da7f8447bb00b28b820cce14e9cc894')

check() {
  cd -- "${pkgname:?}-${pkgver:?}"
  make test
}

package() {
  cd -- "${pkgname:?}-${pkgver:?}"
  make DESTDIR="${pkgdir:?}" prefix="/usr" install
}
