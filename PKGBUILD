# Generated using pip2pkgbuild - https://github.com/wenLiangcan/pip2pkgbuild
# Maintainer: MayorBender <7480812+kingy9000@users.noreply.github.com>

pkgname=lib50
_module='lib50' # PyPI specific
pkgver='3.0.2'
pkgrel=1
pkgdesc="This is lib50, CS50's own internal library used in many of its tools."
url="https://github.com/cs50/lib50"
depends=('python' 'python-attrs' 'python-cryptography' 'python-jellyfish' 'python-pexpect' 'python-termcolor')
makedepends=('python-setuptools')
license=('GPL')
arch=('any')
groups=('cs50')
source=("https://files.pythonhosted.org/packages/source/${_module::1}/$_module/$_module-$pkgver.tar.gz")
sha256sums=('f5cdf1120240c345672fec46bdc04fdc223506803b4aebf41149f4d17bb6c9a9')

build() {
	cd "${srcdir}/${_module}-${pkgver}"
	python setup.py build
}

package() {
	depends+=()
	cd "${srcdir}/${_module}-${pkgver}"
	python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
