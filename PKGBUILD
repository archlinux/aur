# Maintainer:F43nd1r <support@faendir.com>
# Python package author: Thomas Gläßle <thomas@coldfix.de>
_name=certbot-dns-netcup
pkgname=python-$_name
pkgver=2.0.0
pkgrel=1
pkgdesc="netcup DNS Authenticator plugin for Certbot"
arch=(any)
url="https://github.com/coldfix/certbot-dns-netcup"
license=("Apache")
depends=("certbot>=2.7")
makedepends=("python>=3.7" "python-setuptools")
source=("https://github.com/coldfix/$_name/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('facdca0895aac5c6d0f687658b6f291e6f714623dc75d11d1f9e4986a451bdf8')

build() {
    cd $_name-$pkgver
    python setup.py build
}
package() {
    cd $_name-$pkgver
    python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
