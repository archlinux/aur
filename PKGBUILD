pkgname="python-lark"
_pkgname=lark-parser
pkgver=0.6.6
pkgrel=1
pkgdesc="A modern parsing library for Python, implementing Earley & LALR(1) and an easy interface"
url="https://github.com/erezsh/lark"
arch=("any")
license=("MIT")
depends=("python")
makedepends=("python-setuptools")
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('43d623edae6f16db038d29f8586406002f2bea63c0363dc9acbedac27de7040e')

build() {
	cd "${_pkgname}-${pkgver}"
	python setup.py build
}

# upstream tests fail due to path resolution errors
#check() {
#	cd "${_pkgname}-${pkgver}"
#	python setup.py test
#}

package() {
	cd "${_pkgname}-${pkgver}"
	python setup.py install --root="${pkgdir}/" --optimize=1
	install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/"$pkgname"/LICENSE
}
