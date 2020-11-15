# Maintainer: dianlujitao <dianlujitao at gmail dot com>

pkgname=python-browser-cookie3
pkgver=0.11.4
pkgrel=1
pkgdesc="Loads cookies used by your web browser into a cookiejar object"
url="https://github.com/borisbabic/browser_cookie3"
depends=('python' 'python-keyring' 'python-pbkdf2' 'python-pyaes' 'python-crypto' 'python-lz4')
makedepends=('python-setuptools')
license=('MIT')
arch=('any')
source=("browser_cookie3-$pkgver.tar.gz::https://github.com/borisbabic/browser_cookie3/archive/$pkgver.tar.gz")
sha256sums=('005ca4a618938c7118cbbd1cd7926bf38402060ce4d74648683df8b05d0b3571')

build() {
    cd $srcdir/browser_cookie3-$pkgver
    python setup.py build
}

package() {
    cd $srcdir/browser_cookie3-$pkgver
    python setup.py install --root="$pkgdir" --optimize=1
    install -Dm644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
