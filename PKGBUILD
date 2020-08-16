# Generated using pip2pkgbuild - https://github.com/wenLiangcan/pip2pkgbuild
# Maintainer: MayorBender <7480812+kingy9000@users.noreply.github.com>
# Contributor: Peter Lamby <peterlamby@web.de>

pkgname=style50
_module='style50' # PyPi specific
pkgver=2.7.4
pkgrel=1
pkgdesc="This is style50, with which code can be checked against the CS50 style guide"
arch=('any')
url="https://github.com/cs50/style50"
license=('GPL')
groups=('cs50')
depends=('python' 'autopep8' 'icdiff' 'python-argparse' 'python-jsbeautifier' 'python-termcolor')
makedepends=('python-setuptools')
install=${pkgname}.install
source=("https://files.pythonhosted.org/packages/source/${_module::1}/$_module/$_module-$pkgver.tar.gz")
sha256sums=('6bee9cd5b7a02242a627a472b8618768f83c654f4b507f4c2b047437630266c3')

build() {
	cd "${srcdir}/${_module}-${pkgver}"
	python setup.py build
}

package() {
	depends+=()
	cd "${srcdir}/${_module}-${pkgver}"
	python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
