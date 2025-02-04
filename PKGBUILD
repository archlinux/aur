# Maintainer: Sigurd Hellesvik <sigurd@hellesvik.eu>

_pkgname=devicetree
pkgname=python-${_pkgname}
pkgver=0.0.2
pkgrel=1
pkgdesc='Placeholder for moving Zephyr’s devicetree libraries to PyPI.'
arch=('x86_64')
url="https://pypi.org/project/${_pkgname}/"
license=(Apache-2.0)
depends=('python' 'python-pyaml')
source=("${_pkgname}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/d/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('e1b1e84e66705c5190ddd7eaab7242d4948d4add320bd517ac4766f34ce9c0c6')

build() {
	cd "${_pkgname}-${pkgver}"
  python setup.py build
}

package() {
	cd "${_pkgname}-${pkgver}"
	python setup.py install --skip-build --root="${pkgdir}" --optimize=1
}
