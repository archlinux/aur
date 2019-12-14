# Maintainer: Erazem Kokot <contact at erazem dot eu>

pkgname='hblock'
pkgver=2.1.3
pkgrel=1
pkgdesc='An adblocker that creates a hosts file from automatically downloaded blacklists'
arch=('any')
url='https://github.com/hectorm/hblock'
license=('MIT')
depends=('bash' 'zip')
sha256sums=('8f75e25d6bb6352454b475f0e20e935b6bb267b71bbdcac3807476a59af756b6')
source=("https://github.com/hectorm/${pkgname}/archive/v${pkgver}.tar.gz")

build() {
  cd "${pkgname}-${pkgver}"
  make
}

package() {
  cd "${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}/" install
}
