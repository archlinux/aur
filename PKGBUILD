# Maintainer: Erazem Kokot <contact at erazem dot eu>

pkgname='hblock'
pkgver=2.0.9
pkgrel=1
pkgdesc='An adblocker that creates a hosts file from automatically downloaded blacklists'
arch=('any')
url='https://github.com/hectorm/hblock'
license=('MIT')
depends=('bash')
sha256sums=('55f85fe37be0dfc619aaa878548746f8dec4e02c3f5d71a1cf49372bde06a3fe')
source=("https://github.com/hectorm/${pkgname}/archive/v${pkgver}.tar.gz")

build() {
  cd "${pkgname}-${pkgver}"
  make
}

package() {
  cd "${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}/" install
}
