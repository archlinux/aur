# Maintainer: Erazem Kokot <contact at erazem dot eu>

pkgname='hblock'
pkgver=2.1.4
pkgrel=1
pkgdesc='An adblocker that creates a hosts file from automatically downloaded blacklists'
arch=('any')
url='https://github.com/hectorm/hblock'
license=('MIT')
depends=('bash' 'zip')
sha256sums=('5028b51feaeb4a4409f0cbf76e2d6a351440e134250d058a8d0b36a446fa32bb')
source=("https://github.com/hectorm/${pkgname}/archive/v${pkgver}.tar.gz")

build() {
  cd "${pkgname}-${pkgver}"
  make
}

package() {
  cd "${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}/" install
}
