# Maintainer: Achmad Fathoni<fathoni.id(at)gmail.com>
pkgname=python-mbedtls
pkgver=1.7.0
pkgrel=1
pkgdesc="A free cryptographic library for Python that uses mbed TLS for back end."
arch=(any)
url="https://pypi.org/project/python-mbedtls/"
license=('Apache')
makedepends=('python-setuptools'
             'python-pip')
depends=('mbedtls')
source=(https://files.pythonhosted.org/packages/source/${pkgname::1}/$pkgname/$pkgname-$pkgver.tar.gz)
sha256sums=('ffa1a12ec799b6b17ea1c821b37dcbff52b17c225c3a9bb7cb4c6fbc0b6edeca')

package() {
    cd ${srcdir}/${pkgname}-${pkgver}

    python setup.py install --root=${pkgdir} --prefix=/usr --optimize=1
    install -D -m644 README.rst -t "${pkgdir}/usr/share/doc/${pkgname}"
}
