# Maintainer: Erazem Kokot <contact at erazem dot eu>

pkgname='hblock'
pkgver=2.1.1
pkgrel=1
pkgdesc='An adblocker that creates a hosts file from automatically downloaded blacklists'
arch=('any')
url='https://github.com/hectorm/hblock'
license=('MIT')
depends=('bash')
sha256sums=('ed41de0b4a68f6ef1e84452f4d4345f21b852444c2c191d63c4c1ebef10fd2fd')
source=("https://github.com/hectorm/${pkgname}/archive/v${pkgver}.tar.gz")

build() {
  cd "${pkgname}-${pkgver}"
  make
}

package() {
  cd "${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}/" install
}
