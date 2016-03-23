#Maintainer: David McInnis <davidm@eagles.ewu.edu>

pkgname=('python-pydot-ng')
_module='pydot_ng'
pkgver='1.0.0'
pkgrel=1
pkgdesc="Python interface to Graphviz's Dot Language, updated version"
url="https://github.com/pydot/pydot-ng"
depends=('python-pyparsing' 'python-pygraphviz')
makedepends=('python-setuptools')
conflicts=('python-pydot')
#checkdepends=('python-unittest2py3k' 'python-pytest') Test doesn't work current release
license=('MIT')
arch=('any')
source=("https://pypi.python.org/packages/source/p/pydot-ng/pydot_ng-${pkgver}.tar.gz"
        "LICENSE.txt::https://github.com/pydot/pydot-ng/blob/master/LICENSE?raw=true")
sha256sums=('c420ecd08ec34c76bec98fbc1956d58a8f0bbd7b4e1d2dc90664d9fd29471341'
            '6c5d9398c6a89864f5765375fd34529df9d6c929ca532a4e076b7451dfcec357')


package() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1
    install -Dm644 ../LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
}
