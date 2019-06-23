# Generated using pip2pkgbuild - https://github.com/wenLiangcan/pip2pkgbuild
# Maintainer: MayorBender <7480812+kingy9000@users.noreply.github.com>
# Contributor: Peter Lamby <peterlamby@web.de>

pkgname=check50
_module='check50' # PyPI specific
pkgver=2.2.6
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
	'c3430446de5f03a9016d1bb45a09ebe5577d03d386c58b7a5e560d6299a222c7'
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
