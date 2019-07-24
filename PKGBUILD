# Generated using pip2pkgbuild - https://github.com/wenLiangcan/pip2pkgbuild
# Maintainer: MayorBender <7480812+kingy9000@users.noreply.github.com>
# Contributor: Peter Lamby <peterlamby@web.de>

pkgname=style50
_module='style50' # PyPi specific
pkgver=2.6.6
pkgrel=1
pkgdesc="This is style50, with which code can be checked against the CS50 style guide"
arch=('any')
url="https://github.com/cs50/style50"
license=('GPL')
groups=('cs50')
depends=('python' 'autopep8' 'icdiff' 'python-jsbeautifier' 'python-magic-ahupp' 'python-pycodestyle' 'python-termcolor')
makedepends=('python-setuptools')
optdepends=('astyle: To style check C, C++, or Java code')
source=(
	"https://files.pythonhosted.org/packages/source/${_module::1}/$_module/$_module-$pkgver.tar.gz"
)
sha256sums=(
	'e1dddb17537b41bba455ab5d875c1a8bb6a60680fad8316decb2e577212514d8'
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
