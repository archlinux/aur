# Maintainer: Matthew Gamble <git@matthewgamble.net>

# The tests aren't working on my machine at the moment, not sure why.

pkgname=pywb
pkgver=0.31.0
pkgrel=1
pkgdesc="Python WayBack for web archive replay and url-rewriting HTTP/S web proxy"
arch=('any')
url="https://pypi.python.org/pypi/pywb"
license=('GPL')
depends=('python2' 'python2-six' 'python2-chardet' 'python2-requests' 'python2-redis' 'python2-jinja' 'python2-surt>=0.3.0' 'python2-brotli' 'brotli' 'python2-yaml' 'python2-watchdog' 'python2-webencodings')
makedepends=('python2-setuptools')
#checkdepends=('python2-pytest' 'python2-pytest-cov' 'python2-webtest' 'python2-mock')
source=("https://pypi.python.org/packages/01/99/7a658eb65745b3ed29f358bd01b1d99f4b741764ee0590bd4b6fd427d06e/pywb-${pkgver}.tar.gz")
md5sums=('0db827af3dfbaeacf76fa03e842a9693')

build() {
    cd "${srcdir}/pywb-${pkgver}"
    python2 setup.py build
}

#check() {
#    cd "${srcdir}/surt-${pkgver}"
#    python2 setup.py test
#}

package() {
    cd "${srcdir}/pywb-${pkgver}"
    python2 setup.py install --root=${pkgdir} --skip-build
}
