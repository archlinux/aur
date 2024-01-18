# Maintainer: Alex Hirzel <alex at hirzel period us>

pkgname=python-lightning-utilities
_name=${pkgname#python-}
pkgver=0.10.1
pkgrel=1
pkgdesc="Common Python utilities and GitHub Actions in Lightning Ecosystem"
arch=('any')
url='https://github.com/Lightning-AI/utilities'
license=('Apache-2.0')
depends=(python-fire python-importlib-metadata python-packaging python-requests python-setuptools python-typing_extensions)
makedepends=(python-setuptools)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha512sums=('4ee5c26b53b7f65c332242afc35b42484e9eb68973874dca01d22c61becc260e7bc42624467491fb7823eb8e91c2ee78419b6219b9331d182683de09281f1596')

build() {
	cd "${srcdir}/${_name}-${pkgver}"
	python setup.py build
}

package() {
	cd "${srcdir}/${_name}-${pkgver}"
	python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
