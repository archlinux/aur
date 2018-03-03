_name=lark-parser
pkgname="python-lark"
pkgver=0.5.4
pkgrel=1
pkgdesc="A modern parsing library for Python, implementing Earley & LALR(1) and an easy interface"
url="https://github.com/erezsh/lark"
arch=("any")
license=("MIT")
depends=("python")
makedepends=("python-setuptools")
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('8e0b2d0d210b6debc2211c1c7bf4649cb6ccf1b3328ec8f62049e4ab8a13bcd1')

build() {
	cd "${srcdir}/${_name}-${pkgver}"
	python setup.py build
}

package() {
	cd "${srcdir}/${_name}-${pkgver}"
	python setup.py install --root="${pkgdir}/" --optimize=1
}
