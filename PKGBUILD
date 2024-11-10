pkgname=mitogen
pkgver=0.3.18
pkgrel=1
pkgdesc="Distributed self-replicating programs in Python"
license=("BSD-3-Clause")
url="https://mitogen.networkgenomics.com/"
depends=('python')
makedepends=('python-setuptools')
optdepends=('ansible: for using the ansible strategy plugin')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/mitogen-hq/mitogen/archive/v${pkgver//_/-}.tar.gz")
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

sha1sums=('f01d4780684834b4efe9b98c2e56d92bbb48f995')
sha256sums=('d6a4ef1386577eb910b9c190e2419d598972e27a7564d8fbdbacefc450654c0d')
sha384sums=('2ef8fb4465110c2c1806794dfffa1a6d915c561c8ae6c4bd8117e4c53974e8b1f1c25fadee8a1646ca81a8c0c639e368')
sha512sums=('5ebb539070b6b8280b9366eb078fd1958cae884271d7e075a656a84b31761faa2514d5e317868937e1f402cf2ac7cef92b9b6b0e083785af739dedcb34ad5036')
