# Maintainer: Achmad Fathoni<fathoni.id(at)gmail.com>
pkgname=python-mbedtls
pkgver=1.6.0
pkgrel=2
pkgdesc="A free cryptographic library for Python that uses mbed TLS for back end."
arch=(any)
url="https://pypi.org/project/python-mbedtls/"
license=('Apache')
makedepends=('python-setuptools'
             'python-pip')
depends=('mbedtls')
source=(https://files.pythonhosted.org/packages/source/${pkgname::1}/$pkgname/$pkgname-$pkgver.tar.gz)
sha256sums=('86362398aea1b98296a8307658c32e869b91102dfb60d936dbdb65e382e22dc9')

package() {
    cd ${srcdir}/${pkgname}-${pkgver}

    python setup.py install --root=${pkgdir} --prefix=/usr --optimize=1
    install -D -m644 README.rst -t "${pkgdir}/usr/share/doc/${pkgname}"
}
