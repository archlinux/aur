# Maintainer:F43nd1r <support@faendir.com>
# Python package author: Thomas Gläßle <thomas@coldfix.de>
_name=certbot-dns-netcup
pkgname=python-$_name
pkgver=1.1.1
pkgrel=2
pkgdesc="netcup DNS Authenticator plugin for Certbot"
arch=(any)
url="https://github.com/coldfix/certbot-dns-netcup"
license=("Apache")
depends=("python-acme>=0.31.0" "certbot>=0.31.0" "dns-lexicon>=3.2.3" "python-zope-interface")
makedepends=("python" "python-setuptools")
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('d2a4e433b8e0571bc805f7ff060f9ac05014f374824c0cac6c55ea5a9af685be')
build() {
    cd $_name-$pkgver
    python setup.py build
}
package() {
    cd $_name-$pkgver
    python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
