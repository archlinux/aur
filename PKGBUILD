# Maintainer: Martin Schrodt <martin@schrodt.org>

pkgname=vfio-isolate
pkgver=0.2.0
pkgrel=2
pkgdesc="commandline tool to facilitate CPU core isolation"
arch=('i686' 'x86_64')
url="https://pypi.org/project/vfio-isolate"
license=('MIT')
depends=('python' 'python-click' 'python-psutil' 'python-parsimonious')
makedepends=('python-setuptools')
license=('unknown')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/$pkgname/$pkgname-$pkgver.tar.gz")
md5sums=('64a3c4666bcd59f8e1cf1348937a8be1')

build() {
    cd "$pkgname-$pkgver"
    python setup.py build
}

package() {
    cd "$pkgname-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
