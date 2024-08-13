pkgname=mitogen
pkgver=0.3.9
pkgrel=1
pkgdesc="Distributed self-replicating programs in Python"
license=("BSD")
url="https://mitogen.networkgenomics.com/"
depends=('python')
makedepends=('python-setuptools')
optdepends=('ansible: for using the ansible strategy plugin')
source=("https://github.com/mitogen-hq/mitogen/archive/v${pkgver//_/-}.tar.gz")
arch=('any')

build() {
  cd "$srcdir/$pkgname-${pkgver//_/-}"
  python setup.py build
}

package() {
  cd "$srcdir/$pkgname-${pkgver//_/-}"
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

sha1sums=('32bff19bbaf5a58f808c43c6657c25eb69bd6243')
sha256sums=('8d23826eeef4aed48811b486d9a9cf3d713e95d4bbf22c2808dca5ab117402fb')
sha384sums=('084be94369c817d971ecb14c8fb8615ed2a3957680c3163600c10740891987633762d6b4309c49f881cb0574cb052592')
sha512sums=('90a7fa3795d5e154956222b5fb1e4143e64aa500ef6942944a7342f8c93338cfa284c5514fdf6b3c14513a5ab2a03e2919bf0e3d48c8906f0795935379a54311')
