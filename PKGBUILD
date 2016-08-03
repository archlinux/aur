# Maintainer: Jan Cholasta <grubber at grubber cz>
# Contributor: Joshua Leahy <jleahy@gmail.com>

pkgname=python-gssapi
pkgver=1.2.0
pkgrel=1
pkgdesc="Python GSSAPI Wrapper"
arch=(any)
url='https://github.com/pythongssapi/python-gssapi'
license=('custom')
depends=('python>=3.4' 'python-decorator' 'python-six' 'krb5')
makedepends=('python-setuptools')
source=('https://pypi.python.org/packages/d3/ef/6f659d93575a387910edcc0574445f8edfa3e926e6312b39b947c2923d64/gssapi-1.2.0.tar.gz')
md5sums=('5897be5470210cded323add54ba2ca56')

build() {
    cd "${srcdir}/gssapi-${pkgver}"
    python3 setup.py build
}

package() {
    cd "${srcdir}/gssapi-${pkgver}"
    python3 setup.py install -O1 --skip-build --root="${pkgdir}"
    install -D -m644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

