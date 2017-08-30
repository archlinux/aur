# Maintainer: Daniel E. Shub <daniel.e.shub@gmail.com>

_name=pyjson_tricks
pkgname=python2-json-tricks
pkgver=3.8.0
pkgrel=1
pkgdesc="Extra features for Python's JSON: comments, order, numpy, pandas, datetimes, and many more! Simple but customizable."
arch=(any)
url="https://github.com/mverleg/pyjson_tricks"
license=(BSD)
makedepends=(python2-setuptools)
depends=(python2-numpy python2-pytz python2-pandas)
optdepends=(
    'python2-pytest: For tests'
    'python2-coverage: For test coverage'
    'python2-tox: For tests'
    'python2-detox: For parallel tests'
    'python2-sphinx: For documentation'
)
source=("https://github.com/mverleg/${_name}/archive/v${pkgver}.zip")
md5sums=('0e26db5c33b41167669510c286978046')

package() {
    (
        cd "${srcdir}/${_name}-${pkgver}"
        python2 setup.py install --root="${pkgdir}/" --optimize=1
    )
    install -d 644 "${pkgdir}/usr/lib/python2.7/site-packages/json_tricks"
    cp -r "${srcdir}/${_name}-${pkgver}/tests" \
        "${pkgdir}/usr/lib/python2.7/site-packages/json_tricks/tests"
    install -Dm 644 "${srcdir}/${_name}-${pkgver}/LICENSE.txt" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
