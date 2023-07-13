# Maintainer: userbyte <contact@userbyte.xyz>
_pkgname=ipinfo
pkgname=python-ipinfo
pkgver=4.4.2
pkgrel=1
pkgdesc="Official Python library for IPInfo"
url="https://github.com/ipinfo/python"
depends=('python' 'python-requests' 'python-cachetools')
makedepends=('python-setuptools')
license=('Apache')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/$_pkgname/$_pkgname-$pkgver.tar.gz")

sha256sums=('30fe65e50fc8896c5e3adae7548f971c52e1cb7646e5088c35cca2f0a23f3be8')

build() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    python setup.py build
}

package() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
