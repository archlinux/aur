# Maintainer: @RubenKelevra <cyrond@gmail.com>

pkgname='python-securetar'
_module=${pkgname#python-}
pkgver='2024.2.1'
pkgrel=2
pkgdesc="Python module to handle tarfile backups."
url="https://github.com/pvizeli/securetar"
depends=(
	'python>=3.12'
	'python-cryptography'
)
makedepends=('python-setuptools')
license=('Apache')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_module::1}/$_module/$_module-$pkgver.tar.gz")
b2sums=('ff4768bbd474fe71bd00dd86872ae2251f1beb461f00789baa547dda079efa31bc98d5495bb1ede131b1f20b52fdc30e67607dd1d1b25791200412a8f759a236')

build() {
	cd "${srcdir}/${_module}-${pkgver}"
	python setup.py build
}

package() {
	cd "${srcdir}/${_module}-${pkgver}"
	python setup.py install --root="${pkgdir}" --optimize=2 --skip-build
}
