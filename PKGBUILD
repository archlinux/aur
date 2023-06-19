# Maintainer: MoetaYuko <loli at yuko dot moe>

_module=browser-cookie3
pkgname=python-$_module
pkgver=0.19.1
pkgrel=1
pkgdesc="Loads cookies used by your web browser into a cookiejar object"
url="https://github.com/borisbabic/browser_cookie3"
depends=('python-lz4' 'python-pycryptodomex' 'python-jeepney')
makedepends=('python-setuptools')
license=('MIT')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_module::1}/$_module/$_module-$pkgver.tar.gz")
sha256sums=('3031ad14b96b47ef1e4c8545f2f463e10ad844ef834dcd0ebdae361e31c6119a')

build() {
    cd $srcdir/$_module-$pkgver
    python setup.py build
}

package() {
    cd $srcdir/$_module-$pkgver
    python setup.py install --root="$pkgdir" --optimize=1
    install -Dm644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
