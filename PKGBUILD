# Maintainer: Michael Krayer <aur at mkray dot de>

pkgname='python-keepassxc-proxy-client'
pkgver=0.1.7
pkgrel=1
pkgdesc='A CLI for keepassxc-proxy.'
arch=('any')
url='https://pypi.org/project/keepassxc-proxy-client/'
license=('custom:0BSD')
depends=('keepassxc')
makedepends=('python-setuptools')
_name='keepassxc-proxy-client'
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('652f0c00f38fd947d3efe502ac44b8a59cc8d4ca6b62561110fad835a81107a0')

build() {
    cd $srcdir/$_name-$pkgver
    python setup.py build
}

package() {
    cd $srcdir/$_name-$pkgver
    python setup.py install --root="$pkgdir"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
