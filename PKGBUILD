# Maintainer: Achmad Fathoni<fathoni.id(at)gmail.com>
pkgname=python-mbedtls
pkgver=1.5.1
pkgrel=1
pkgdesc="A free cryptographic library for Python that uses mbed TLS for back end."
arch=(any)
url="https://pypi.org/project/python-mbedtls/"
license=('Apache')
makedepends=('python-setuptools'
             'mbedtls')
source=(https://files.pythonhosted.org/packages/source/${pkgname::1}/$pkgname/$pkgname-$pkgver.tar.gz)
sha256sums=('21e4ae674e3830d1c03f801323aa3849c1bdf0760beb0c3b90e2adb98e18f708')

package() {
    cd ${srcdir}/${pkgname}-${pkgver}

    python setup.py install --root=${pkgdir} --prefix=/usr --optimize=1
    install -D -m644 README.rst -t "${pkgdir}/usr/share/doc/${pkgname}"
}
