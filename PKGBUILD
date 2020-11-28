# Maintainer: Achmad Fathoni<fathoni.id(at)gmail.com>
pkgname=python-mbedtls
pkgver=1.4.0
pkgrel=1
pkgdesc="A free cryptographic library for Python that uses mbed TLS for back end."
arch=(any)
url="https://pypi.org/project/$pkgname"
license=('Apache')
makedepends=('python-setuptools')
source=(https://files.pythonhosted.org/packages/source/${pkgname::1}/$pkgname/$pkgname-$pkgver.tar.gz)
sha256sums=('d01a4667881667790a809c1e3674ac328415b0fc5251101857884e561ddc2973')


package() {
    cd ${srcdir}/${pkgname}-${pkgver}

    python setup.py install --root=${pkgdir} --prefix=/usr
    install -D -m644 README.rst -t "${pkgdir}/usr/share/doc/${pkgname}"
}
