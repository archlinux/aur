# Contributor: Daniel E. Shub <daniel.e.shub@gmail.com>
_base=pyjson_tricks
pkgname=python2-json-tricks
pkgver=3.8.0
pkgrel=2
pkgdesc="Extra features for Python's JSON: comments, order, numpy, pandas, datetimes, and many more! Simple but customizable."
arch=(any)
url="https://github.com/mverleg/${_base}"
license=(BSD)
makedepends=(python2-setuptools)
depends=(python2-pytz python2-pandas)
optdepends=(
    'python2-pytest: For tests'
    'python2-tox: For tests'
    'python2-sphinx: For documentation'
)
source=(${url}/archive/v${pkgver}.zip)
md5sums=('0e26db5c33b41167669510c286978046')

package() {
    cd ${_base}-${pkgver}
    python2 setup.py install --root="${pkgdir}/" --optimize=1
    install -d 644 "${pkgdir}/usr/lib/python2.7/site-packages/json_tricks"
    cp -r "${srcdir}/${_base}-${pkgver}/tests" \
        "${pkgdir}/usr/lib/python2.7/site-packages/json_tricks/tests"
    install -Dm 644 "${srcdir}/${_base}-${pkgver}/LICENSE.txt" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
