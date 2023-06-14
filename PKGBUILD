# Maintainer:F43nd1r <support@faendir.com>
# Python package author: Thomas Gläßle <thomas@coldfix.de>
_name=certbot-dns-netcup
pkgname=python-$_name
pkgver=1.3.0
pkgrel=1
pkgdesc="netcup DNS Authenticator plugin for Certbot"
arch=(any)
url="https://github.com/coldfix/certbot-dns-netcup"
license=("Apache")
depends=("certbot>=0.31.0" "dns-lexicon>=3.2.3")
makedepends=("python" "python-setuptools")
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('557b52d2db3e3090f8648ce69668ce9bab1e1d7d3f93f101e88306d20e949a24')

build() {
    cd $_name-$pkgver
    python setup.py build
}
package() {
    cd $_name-$pkgver
    python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
