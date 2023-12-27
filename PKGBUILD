# Maintainer: Alex Hirzel <alex at hirzel period us>

pkgname=python-lightning-utilities
_name=${pkgname#python-}
pkgver=0.10.0
pkgrel=2
pkgdesc="Common Python utilities and GitHub Actions in Lightning Ecosystem"
arch=('any')
url='https://github.com/Lightning-AI/utilities'
license=('Apache')
depends=(python-fire python-importlib-metadata python-packaging python-requests python-setuptools python-typing_extensions)
makedepends=(python-setuptools)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha512sums=('96b4f505faa156d93287185ed1c27128abe6a721aa90efd332f5bcddbebc42824d59c17b2f6e5eb5d897015ff6ed09836fb90e0da94edca33d005bd689ea3d14')

build() {
	cd "${srcdir}/${_name}-${pkgver}"
	python setup.py build
}

package() {
	cd "${srcdir}/${_name}-${pkgver}"
	python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
