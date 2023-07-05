# Maintainer: Alex Hirzel <alex at hirzel period us>

pkgname=python-lightning-utilities
_name=${pkgname#python-}
pkgver=0.9.0
pkgrel=1
pkgdesc="Common Python utilities and GitHub Actions in Lightning Ecosystem"
arch=('any')
url='https://github.com/Lightning-AI/utilities'
license=('Apache')
depends=(python-fire python-importlib-metadata python-packaging python-requests python-setuptools python-typing_extensions)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha512sums=('95e6f705ce633deef94d3b9c9aa1a8803b737f433097896841722283af51f1b456cf9d556aa09187e2042476884380090536b6029027931e476e0d9bd634bc48')

build() {
	cd "${srcdir}/${_name}-${pkgver}"
	python setup.py build
}

package() {
	cd "${srcdir}/${_name}-${pkgver}"
	python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
