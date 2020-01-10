# Maintainer:F43nd1r <support@faendir.com>
# Python package author: Thomas Gläßle <thomas@coldfix.de>
_name=certbot-dns-netcup
pkgname=python-$_name
pkgver=0.31.0.1
pkgrel=1
pkgdesc="netcup DNS Authenticator plugin for Certbot"
arch=(any)
url="https://github.com/coldfix/certbot-dns-netcup"
license=(Apache License 2.0)
makedepends=("python" "python-setuptools")
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('19693246ba8adc4550b18bb3cb00b9a4b2a0add737d76f62c1169cfc055293fc')
build() {
    cd $_name-$pkgver
    python setup.py build
}
package() {
    cd $_name-$pkgver
    python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
