# Maintainer:F43nd1r <support@faendir.com>
# Python package author: Thomas Gläßle <thomas@coldfix.de>
_name=certbot-dns-netcup
pkgname=python-$_name
pkgver=1.4.3
pkgrel=1
pkgdesc="netcup DNS Authenticator plugin for Certbot"
arch=(any)
url="https://github.com/coldfix/certbot-dns-netcup"
license=("Apache")
depends=("certbot>=0.31.0" "dns-lexicon>=3.2.3")
makedepends=("python" "python-setuptools")
source=("https://github.com/coldfix/$_name/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('f817dc36ba293e3f355b711df30271019fabbd51a18575302eb594e133feaa74')

build() {
    cd $_name-$pkgver
    python setup.py build
}
package() {
    cd $_name-$pkgver
    python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
