# Maintainer: Joshua Leahy <jleahy@gmail.com>

pkgname=python2-gssapi
pkgver=1.2.0
pkgrel=1
pkgdesc="Python GSSAPI Wrapper"
arch=(any)
url='https://github.com/pythongssapi/python-gssapi'
license=('custom')
depends=('python2' 'python2-decorator' 'python2-six' 'python2-enum34' 'krb5')
makedepends=('python2-setuptools')
source=('https://pypi.python.org/packages/d3/ef/6f659d93575a387910edcc0574445f8edfa3e926e6312b39b947c2923d64/gssapi-1.2.0.tar.gz')
md5sums=('5897be5470210cded323add54ba2ca56')

build() {
    cd "${srcdir}/gssapi-${pkgver}"
    python2 setup.py build
}

package() {
    cd "${srcdir}/gssapi-${pkgver}"
    python2 setup.py install -O1 --skip-build --root="${pkgdir}"
    install -D -m644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

