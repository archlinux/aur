# Generated using pip2pkgbuild - https://github.com/wenLiangcan/pip2pkgbuild
# Maintainer: MayorBender <7480812+kingy9000@users.noreply.github.com>
# Contributor: Peter Lamby <peterlamby@web.de>

pkgname=check50
_module='check50' # PyPI specific
pkgver=3.3.3
pkgrel=1
pkgdesc="This is check50, with which you can check solutions to problems for CS50."
arch=('any')
url="https://github.com/cs50/check50"
license=('GPL')
groups=('cs50');
depends=('lib50' 'python-beautifulsoup4' 'python-pyaml' 'python-jinja')
makedepends=('python-setuptools')
source=(
	"https://files.pythonhosted.org/packages/source/${_module::1}/$_module/$_module-$pkgver.tar.gz"
)
sha256sums=(
	'61995f43be54d6c90ad60fb81196dab9a1f2d283b6470bf1fac6e5cd43ba002d'
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
