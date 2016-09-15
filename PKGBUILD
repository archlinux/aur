pkgbase=('python-pomegranate')
pkgname=('python-pomegranate')
_module='pomegranate'
pkgver='0.6.0'
pkgrel=1
pkgdesc="Pomegranate is a graphical models library for Python, implemented in Cython for speed."
url="http://pypi.python.org/pypi/pomegranate/"
depends=('python' 'cython' 'python-networkx' 'python-joblib' 'python-numpy' 'python-scipy')
makedepends=('python-setuptools')
license=('MIT')
arch=('any')
source=("https://pypi.python.org/packages/60/8a/7631cef015f03956ea5902d705199050ebe65ec9eeb9573e73e1e600f051/pomegranate-${pkgver}.tar.gz")
md5sums=('ab106cafc9939a7e198de9edec83c161')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    depends+=()
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
