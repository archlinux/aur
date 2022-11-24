# Maintainer: Alex Hirzel <alex at hirzel period us>

pkgname=python-lightning-utilities
_name=${pkgname#python-}
pkgver=0.4.1
pkgrel=1
pkgdesc="Common Python utilities and GitHub Actions in Lightning Ecosystem"
arch=('any')
url='https://github.com/Lightning-AI/utilities'
license=('Apache')
depends=(python-fire python-importlib-metadata python-setuptools)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha512sums=('f2834cd4e73dc09b634f63c9d86cf22b93fceccddb3c268dc64c92215bf077d8dfd9eff18b03720a56823ed18ec06003587b01eab9189f0b0e71c5866024c112')

build() {
	cd "${srcdir}/${_name}-${pkgver}"
	python setup.py build
}

package() {
	cd "${srcdir}/${_name}-${pkgver}"
	python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
