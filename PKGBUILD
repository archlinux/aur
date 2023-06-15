# Maintainer: Michael Krayer <aur at mkray dot de>

pkgname='python-keepassxc-proxy-client'
pkgver=0.1.5
pkgrel=1
pkgdesc='A CLI for keepassxc-proxy.'
arch=('any')
url='https://github.com/hargoniX/keepassxc-proxy-client'
license=('custom:0BSD')
depends=('keepassxc')
makedepends=('python-setuptools')
_name='keepassxc-proxy-client'
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('e4abaf314f9d7350f31878b9e69eeb1cde02b0c9269ddf75a6dff44f6f60558d')

build() {
    cd $srcdir/$_name-$pkgver
    python setup.py build
}

package() {
    cd $srcdir/$_name-$pkgver
    python setup.py install --root="$pkgdir"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
