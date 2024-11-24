# Maintainer: Ash <xash at riseup d0t net>
pkgname=python-pprp
pkgver=0.2.7
pkgrel=1
pkgdesc="A Python library for processing playlist and other related parsing tasks."
arch=('any')
url="https://pypi.org/project/pprp"
license=('GPL2')
depends=('python')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/7d/8a/6bcc32e0f6cf0a9e0132230cb41652bd3df3dbdb0e673e31b720b6111deb/pprp-$pkgver.tar.gz")
sha256sums=('d9e76779cc52b0938dbc7f5727a195dc4c6075c3eb504025611a59b7636b930d')

build() {
    cd "$srcdir/pprp-$pkgver"
    python setup.py build
}

package() {
    cd "$srcdir/pprp-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1
    rm -rf "$pkgdir/usr/lib/python3.12/site-packages/tests"
}
