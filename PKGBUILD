# Maintainer:F43nd1r <support@faendir.com>
# Python package author: Thomas Gläßle <thomas@coldfix.de>
_name=certbot-dns-netcup
pkgname=python-$_name
pkgver=1.4.4
pkgrel=1
pkgdesc="netcup DNS Authenticator plugin for Certbot"
arch=(any)
url="https://github.com/coldfix/certbot-dns-netcup"
license=("Apache")
depends=("certbot>=0.31.0" "dns-lexicon>=3.2.3")
makedepends=("python" "python-setuptools")
source=("https://github.com/coldfix/$_name/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('2340df80618b6edf282a3a050e4aa0d0e3a6912070a8c1dbbee55e2bac0e1340')

build() {
    cd $_name-$pkgver
    python setup.py build
}
package() {
    cd $_name-$pkgver
    python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
