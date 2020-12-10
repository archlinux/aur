# Maintainer: Peter Taylor <me@et1.uk>
pkgname=python-pyfttt
pkgver=0.3.2
pkgrel=1
pkgdesc="Python tools for interacting with IFTTT Webhooks Channel."
url="https://github.com/briandconnelly/pyfttt"
arch=('any')
license=('BSD')
depends=(
    'python'
    'python-requests'
)
source=("${url}/archive/v${pkgver}.tar.gz")
md5sums=('27390768888ca9e50fe8b4b86d018755')

build() {
    cd $srcdir/pyfttt-$pkgver
    python setup.py build
}

package() {
    cd $srcdir/pyfttt-$pkgver
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}