# Maintainer: Gobidev <adrian[dot]groh[at]t[dash]online[dot]de>

pkgname=dunk
pkgver=0.4.0a0
pkgrel=1
pkgdesc="Prettier git diffs in the terminal"
arch=('any')
url="https://pypi.org/project/dunk/"
license=('unknown')
provides=('dunk')
depends=('python' 'python-setuptools' 'python-unidiff' 'python-rich')
source=("https://files.pythonhosted.org/packages/source/d/dunk/${pkgname}-${pkgver}.tar.gz")
b2sums=('79731193efbd4de365069537e1cb28d1823a950f8564252f3a3a5892ec286c2d0259ff2069c885413ae36eefe4ee335e32651f2baf6d01ed902b6b8bf326517e')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1
}
