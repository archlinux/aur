PACKAGER="Laurent Brock <incognito0135@protonmail.com>"

pkgname=osprey-dpd
pkgver=1.2
pkgrel=3
pkgdesc='Open source polymer research engine-dissipative particle dynamics'
url='https://github.com/Osprey-DPD/osprey-dpd'
license=('BSD')
arch=('any')
makedepends=('cmake' 'ninja')
source=("$pkgname-$pkgver.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha512sums=('abf21c84ac7284ee269cf1f4a7c4368ab3eeaa5830b6dbf515fd0ca3c6923d86c38b1bc255907f7a25a773c72f6024d3cbddc9dbaf3dc280c9ff5610fff1159d')

build() {
  cd ${pkgname}-${pkgver}
  cmake . -GNinja
  ninja
}

package() {
  cd ${pkgname}-${pkgver}
  install -Dm755 dpd "$pkgdir/usr/bin/osprey-dpd"
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/"${pkgname}"/LICENSE
}

