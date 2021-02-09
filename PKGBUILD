# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname=python-rmcl
pkgver=0.3.0
pkgrel=1
pkgdesc="FUSE access to the reMarkable Cloud"
arch=(any)
url="https://github.com/rschroll/rmfuse/"
license=('MIT')
depends=('python-trio' 'python-asks' 'python-pyxdg')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/r/rmcl/rmcl-$pkgver.tar.gz")
sha256sums=('df5c38176309cb119c29bf9bca9d8f2f6427280241a882106b939db17ef48f3d')

build() {
    cd "$srcdir"/rmcl-$pkgver
    python setup.py build
}

package() {
    cd "$srcdir"/rmcl-$pkgver
    python setup.py install -O1 --skip-build --root="$pkgdir"
    install -Dm0644 LICENSE.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
