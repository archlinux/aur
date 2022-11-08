# Maintainer: Matt Robinson <aur@nerdoftheherd.com>
# Contributor: Sabart Otto - Seberm <seberm[at]gmail[dot].com
# Contributor: Uzsolt

pkgname=simple-tpm-pk11
pkgver=0.06
pkgrel=2
pkgdesc="Simple PKCS11 provider for TPM chips"
url="https://github.com/ThomasHabets/simple-tpm-pk11"
arch=('x86_64')
license=('APACHE')
depends=('trousers' 'opencryptoki')
source=("$pkgname-$pkgver.tar.gz::https://github.com/ThomasHabets/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('8ecdb2a64e046e04bb18d464fd15332c99be82084eb2bd3d340a5ff0e738dcea')

prepare() {
  cd ${pkgname}-${pkgver}
  ./bootstrap.sh
}

build() {
  cd ${pkgname}-${pkgver}
  ./configure -prefix=/usr
  make
}

package() {
  cd ${pkgname}-${pkgver}
  make DESTDIR=${pkgdir} install
}
