# Maintainer: Alex Hirzel <alex at hirzel period us>

pkgname=python-lightning-utilities
_name=${pkgname#python-}
pkgver=0.8.0
pkgrel=1
pkgdesc="Common Python utilities and GitHub Actions in Lightning Ecosystem"
arch=('any')
url='https://github.com/Lightning-AI/utilities'
license=('Apache')
depends=(python-fire python-importlib-metadata python-setuptools)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha512sums=('2d93e3c879a84dee8d866294f88f7bf1f1ea33df40f4c29f0df030d037193237a97cf6f8ccb3efa0308757e9e3052dcd077c2e71c154cddcf4e345ad1886a9d5')

build() {
	cd "${srcdir}/${_name}-${pkgver}"
	python setup.py build
}

package() {
	cd "${srcdir}/${_name}-${pkgver}"
	python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
