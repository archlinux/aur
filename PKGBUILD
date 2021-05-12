# Maintainer: dianlujitao <dianlujitao at gmail dot com>

pkgname=python-browser-cookie3
pkgver=0.12.0
pkgrel=1
pkgdesc="Loads cookies used by your web browser into a cookiejar object"
url="https://github.com/borisbabic/browser_cookie3"
depends=('python' 'python-keyring' 'python-pbkdf2' 'python-pyaes' 'python-crypto' 'python-lz4')
makedepends=('python-setuptools')
license=('MIT')
arch=('any')
source=("browser_cookie3-$pkgver.tar.gz::https://github.com/borisbabic/browser_cookie3/archive/$pkgver.tar.gz")
sha256sums=('2fb568ee570bded6a64831dc12bd096b1ddd6dc1f1c39fd5063171f611dd22f5')

build() {
    cd $srcdir/browser_cookie3-$pkgver
    python setup.py build
}

package() {
    cd $srcdir/browser_cookie3-$pkgver
    python setup.py install --root="$pkgdir" --optimize=1
    install -Dm644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
