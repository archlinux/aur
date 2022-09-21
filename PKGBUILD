# Maintainer: Laurent Brock <incognito0135 at protonmail dot com>

pkgname=osprey-dpd
pkgver=1.1
pkgrel=1
pkgdesc='Open source polymer research engine-dissipative particle dynamics'
url='https://github.com/Osprey-DPD/osprey-dpd'
license=('BSD')
arch=('any')
makedepends=('cmake')
source=("$pkgname-$pkgver.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha512sums=('0464ad20ac2c9554ef920e08c241962cb070c640b4c1b52ce8416a8df0463c880628c100d61419a5ee4fa3afbc6bd7ea4364c54ec64f6c5a2f484402e5e6696f')

build() {
  cd ${pkgname}-${pkgver}
  cmake .
  make
}

package() {
  cd ${pkgname}-${pkgver}
  install -Dm755 dpd "$pkgdir/usr/bin/osprey-dpd"
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/"${pkgname}"/LICENSE
}
