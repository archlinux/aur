# Maintainer: MoetaYuko <loli at yuko dot moe>

_module=browser-cookie3
pkgname=python-$_module
pkgver=0.17.1
pkgrel=1
pkgdesc="Loads cookies used by your web browser into a cookiejar object"
url="https://github.com/borisbabic/browser_cookie3"
depends=('python-lz4' 'python-pycryptodomex')
makedepends=('python-setuptools')
license=('MIT')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_module::1}/$_module/$_module-$pkgver.tar.gz")
sha256sums=('53f7ab92ab13703603cae5674719bc95ffcc6c6d1cd3328dd022fa72a5c25b5e')

build() {
    cd $srcdir/$_module-$pkgver
    python setup.py build
}

package() {
    cd $srcdir/$_module-$pkgver
    python setup.py install --root="$pkgdir" --optimize=1
    install -Dm644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
