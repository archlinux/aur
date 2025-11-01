# Maintainer: David McInnis <dave@dave3.xyz>
# Contributor: Gerald Kaszuba <pycallgraph@gakman.com>
# Contributor: SecByShresth <Shresthpaul133@gmail.com>

pkgname=('python-pycallgraph')
_name='python-call-graph'
pkgver='2.1.6'
pkgrel=3
pkgdesc="Library and command line tool that visualises the flow of your Python application."
url="http://pycallgraph.slowchop.com/"
depends=('python')
makedepends=('python-setuptools' 'python-pygraphviz')
license=('GPL')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/p/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('24d49b1f348b6d85ab5ee886b240d38b983574e995bf38c18bbbe4c01865d950')

build() {
    cd "${srcdir}/${_name}-${pkgver}"
    python setup.py build
}

#check() {
#    cd "${srcdir}/${_name}-${pkgver}"
#    python setup.py test
#}

package() {
    cd "${srcdir}/${_name}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
    install -D -m644 man/pycallgraph.1 $pkgdir/usr/share/man/man1/pycallgraph.1
    install -D -m644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
