# Maintainer: Erazem Kokot <contact at erazem dot eu>

pkgname='hblock'
pkgver=2.0.6
pkgrel=1
pkgdesc='An adblocker that creates a hosts file from automatically downloaded blacklists'
arch=('any')
url='https://github.com/hectorm/hblock'
license=('MIT')
depends=('bash')
sha256sums=('267cad304a4618e12ca1768c11db7aa1769d0b9ba3ba6a4d758c5e2b712ff0cd')
source=("https://github.com/hectorm/${pkgname}/archive/v${pkgver}.tar.gz")

build() {
  cd "${pkgname}-${pkgver}"
  make
}

package() {
  cd "${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}/" install
}
