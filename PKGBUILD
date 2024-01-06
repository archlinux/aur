# Maintainer: userbyte <contact@userbyte.xyz>
_pkgname=ipinfo
pkgname=python-ipinfo
pkgver=5.0.0
pkgrel=1
pkgdesc="Official Python library for IPInfo"
url="https://github.com/ipinfo/python"
depends=('python' 'python-requests' 'python-cachetools' 'python-aiohttp')
makedepends=('python-setuptools')
license=('Apache')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/$_pkgname/$_pkgname-$pkgver.tar.gz")

sha256sums=('17d8b9db7a72991a4d0c91a0bfbaed80ea40eb251bb97ecc452a70e73d47613d')

build() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    python setup.py build
}

package() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
    chmod -R 755 ${pkgdir}/usr/lib/python*/site-packages/$_pkgname*
}
