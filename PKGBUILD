pkgname=denonavr-cli
pkgver=4
pkgrel=1
pkgdesc="Minimal CLI for Denon (and Marantz) AVRs, using the Python denonavr library."
arch=(any)
url="https://github.com/projg2/denonavr-cli"
license=('GPL-2.0-or-later')
depends=('python-denonavr>=1.0.0')
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel' 'python-flit-core')
source=("https://github.com/projg2/denonavr-cli/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('4c339d3042b1fb4b88a962a4d82fd2f93b645a9d4cac507ef820586fa1a82770')
sha512sums=('8383e97fdd339791b613f5ac3bef469f2ce0b02be8086eae9dc6f93c2afd21e6d4f22ee96061c2b844cfd6d5a4140d830be7979179f9fb98c5d53075e76de5ac')
b2sums=('a7bdca55c45a31fe22174a5f9cb72b38a049bc89c8891d411675c496ac283a6e6d32a85cadc68e902db525411ce2e380b5fd548619ca54a317d43ce6abd36bf6')

build() {
  cd ${srcdir}/${pkgname}-${pkgver}
  python -m build --wheel --no-isolation
}

package() {
  cd ${srcdir}/${pkgname}-${pkgver}
  python -m installer --destdir="$pkgdir" dist/*.whl
}
