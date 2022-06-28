# Maintainer: MoetaYuko <loli at yuko dot moe>

_module=browser-cookie3
pkgname=python-$_module
pkgver=0.15.0
pkgrel=1
pkgdesc="Loads cookies used by your web browser into a cookiejar object"
url="https://github.com/borisbabic/browser_cookie3"
depends=('python-pyaes' 'python-pbkdf2' 'python-keyring' 'python-lz4' 'python-pycryptodome' 'python-secretstorage')
makedepends=('python-setuptools')
license=('MIT')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_module::1}/$_module/$_module-$pkgver.tar.gz")
sha256sums=('01f44bdaed703175c209f2b2ac3d05f7a8576a9f3c4d0c7b0f57e315618a0f2e')

build() {
    cd $srcdir/$_module-$pkgver
    python setup.py build
}

package() {
    cd $srcdir/$_module-$pkgver
    python setup.py install --root="$pkgdir" --optimize=1
    install -Dm644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
