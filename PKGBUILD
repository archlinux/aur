# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname=rmfuse
pkgver=0.1.1
pkgrel=1
pkgdesc="FUSE access to the reMarkable Cloud"
arch=(any)
url="https://github.com/rschroll/rmfuse/"
license=('MIT')
depends=('python-pyfuse3' 'python-bidict' 'python-rmcl' 'python-rmrl')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/r/rmfuse/rmfuse-$pkgver.tar.gz")
sha256sums=('358454373e505a56b8645b7f15d42f0ec118ccf28d3e3e8f4530210ddb67cf22')

build() {
    cd "$srcdir"/rmfuse-$pkgver
    python setup.py build
}

package() {
    cd "$srcdir"/rmfuse-$pkgver
    python setup.py install -O1 --skip-build --root="$pkgdir"
    install -Dm0644 LICENSE.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
