# Maintainer: Harrison <contact@htv04.com>
# Contributor: Vladislav Ivanishin <vladislav.ivanishin@gmail.com>
# Contributor: Aetf <aetf@unlimitedcodeworks.xyz>
# Contributor: Hugo Osvaldo Barrera <hugo@barrera.io>
# Contributor: Christoph Gysin <christoph.gysin@gmail.com>

pkgname=facetimehd-dkms
pkgver=0.6.8.2
pkgrel=2
pkgdesc='Reverse engineered Linux driver for the FacetimeHD (Broadcom 1570) PCIe webcam'
arch=('any')
url='https://github.com/patjak/facetimehd'
license=('GPL2')
depends=('facetimehd-firmware' 'dkms')
makedepends=('git')
optdepends=('facetimehd-data: Sensor calibration data')
provides=('facetimehd-dkms' 'bcwc-pcie' 'bcwc-pcie-dkms')
replaces=('facetimehd-dkms' 'bcwc-pcie' 'bcwc-pcie-dkms')

source=("$pkgname::git+https://github.com/patjak/facetimehd.git#tag=$pkgver")
sha256sums=('SKIP')

package() {
  cd "$srcdir/$pkgname"
  for FILE in dkms.conf Makefile *.[ch]; do
    install -Dm644 "$FILE" "$pkgdir/usr/src/facetimehd-$pkgver/$FILE"
  done
}
