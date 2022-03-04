# Maintainer: MoetaYuko <loli at yuko dot moe>

pkgname=python-browser-cookie3
pkgver=0.13.0
pkgrel=1
pkgdesc="Loads cookies used by your web browser into a cookiejar object"
url="https://github.com/borisbabic/browser_cookie3"
depends=('python-keyring' 'python-pbkdf2' 'python-pyaes' 'python-crypto' 'python-lz4' 'python-pycryptodomex' 'python-secretstorage')
makedepends=('python-setuptools')
license=('MIT')
arch=('any')
source=("browser_cookie3-$pkgver.tar.gz::https://github.com/borisbabic/browser_cookie3/archive/$pkgver.tar.gz")
sha256sums=('b0266bf0c0cc145480d2ed470fe53be5bf9272f0f184dc355869005cb27d6aa5')

build() {
    cd $srcdir/browser_cookie3-$pkgver
    python setup.py build
}

package() {
    cd $srcdir/browser_cookie3-$pkgver
    python setup.py install --root="$pkgdir" --optimize=1
    install -Dm644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
