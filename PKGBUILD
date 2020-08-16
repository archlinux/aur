# Generated using pip2pkgbuild - https://github.com/wenLiangcan/pip2pkgbuild
# Maintainer: MayorBender <7480812+kingy9000@users.noreply.github.com>
# Contributor: Peter Lamby <peterlamby@web.de>

pkgname=check50
_module='check50' # PyPI specific
pkgver=3.1.2
pkgrel=1
pkgdesc="This is check50, with which you can check solutions to problems for CS50."
arch=('any')
url="https://github.com/cs50/check50"
license=('GPL')
groups=('cs50');
depends=('python' 'python-bs4' 'python-pyaml' 'submit50')
makedepends=('python-setuptools')
source=(
	"https://files.pythonhosted.org/packages/source/${_module::1}/$_module/$_module-$pkgver.tar.gz"
)
sha256sums=(
	'e34d39c9a230e80dc2105737f64f9d93bcecb150e184fc70bff2ac849c5f9bd4'
)

build() {
	cd "${srcdir}/${_module}-${pkgver}"
	python setup.py build
}

package() {
	depends+=()
	cd "${srcdir}/${_module}-${pkgver}"
	python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
