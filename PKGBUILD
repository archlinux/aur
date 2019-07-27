# Generated using pip2pkgbuild - https://github.com/wenLiangcan/pip2pkgbuild
# Maintainer: MayorBender <7480812+kingy9000@users.noreply.github.com>
# Contributor: Peter Lamby <peterlamby@web.de>

pkgname=check50
_module='check50' # PyPI specific
pkgver=2.2.7
pkgrel=1
pkgdesc="This is check50, with which you can check solutions to problems for CS50."
arch=('any')
url="https://github.com/cs50/check50"
license=('GPL')
groups=('cs50');
depends=('python' 'submit50')
makedepends=('python-setuptools')
source=(
	"https://files.pythonhosted.org/packages/source/${_module::1}/$_module/$_module-$pkgver.tar.gz"
)
sha256sums=(
	'6ad46b75f1b19d485a105976a684ec67a37356471a2c2b206cf85086624bde8c'
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
