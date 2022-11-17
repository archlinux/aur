# Maintainer: Onur BÜBER <onurbuber@engineer.com>

pkgname=python-fsociety
pkgdesc="A Modular Penetration Testing Framework"
pkgver=3.2.8
pkgrel=2
arch=('any')
license=('MIT')
depends=('python-gitpython')
makedepends=('python' 'python-setuptools')
provides=('python-fsociety')
conflicts=('python-fsociety')
url="https://github.com/fsociety-team/fsociety"
_pyname="fsociety"
source=("$pkgname-$pkgver.tar.gz::https://github.com/fsociety-team/fsociety/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('06b3160fdb554d4f8b58dbc0e3ac05f2e48877a6d17d04a8e18d75522c37b8b4')

build() {
    cd $srcdir/$_pyname-$pkgver
    python setup.py build
}

package() {
    cd $srcdir/$_pyname-$pkgver
    python setup.py install --root="$pkgdir"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
