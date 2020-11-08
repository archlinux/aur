# Maintainer: Héctor Molinero Fernández <hector at molinero dot dev>
# Contributor: Erazem Kokot <contact at erazem dot eu>
pkgname='hblock'
pkgver='3.0.1'
pkgrel='1'
pkgdesc='An adblocker that creates a hosts file from automatically downloaded sources'
arch=('any')
url='https://github.com/hectorm/hblock'
license=('MIT')
depends=('curl')
checkdepends=('libidn2')
source=("https://github.com/hectorm/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('8798c2fad8442156bf2aa7eff61260626100ab25d96a1b04265a5225b3f7c324')

check() {
  cd -- "${pkgname:?}-${pkgver:?}"
  make test
}

package() {
  cd -- "${pkgname:?}-${pkgver:?}"
  make DESTDIR="${pkgdir:?}" prefix="/usr" install
}
