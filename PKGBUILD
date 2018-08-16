_name=lark-parser
pkgname="python-lark"
pkgver=0.6.3
pkgrel=1
pkgdesc="A modern parsing library for Python, implementing Earley & LALR(1) and an easy interface"
url="https://github.com/erezsh/lark"
arch=("any")
license=("MIT")
depends=("python")
makedepends=("python-setuptools")
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('5548041cfcf2e2b0998b46b5a4087a2ba9871f55ee3c7903204788652bb6e532')

build() {
	cd "${srcdir}/${_name}-${pkgver}"
	python setup.py build
}

package() {
	cd "${srcdir}/${_name}-${pkgver}"
	python setup.py install --root="${pkgdir}/" --optimize=1
}
