# Maintainer: Héctor Molinero Fernández <hector at molinero dot dev>
# Contributor: Erazem Kokot <contact at erazem dot eu>
pkgname='hblock'
pkgver='3.3.1'
pkgrel='1'
pkgdesc='Adblocker that creates a hosts file from multiple sources'
arch=('any')
url='https://github.com/hectorm/hblock'
license=('MIT')
depends=('curl')
source=("https://github.com/hectorm/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('649ef980871d4be467a43edfa99c636b95b5af38ee976985082a65c4989eac01')

check() {
  cd -- "${pkgname:?}-${pkgver:?}"
  make test
}

package() {
  cd -- "${pkgname:?}-${pkgver:?}"
  make DESTDIR="${pkgdir:?}" prefix="/usr" install
}
