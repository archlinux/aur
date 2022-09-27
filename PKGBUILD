_pipname=dj_settings
pkgname="python-${_pipname//_/-}"
pkgver=4.0.0
pkgrel=1
pkgdesc="Settings manager and configuration parser"
arch=('any')
url="https://github.com/spapanik/dj_settings"
license=('LGPL3')
depends=('python-tomli' 'python-yaml')
source=("https://files.pythonhosted.org/packages/source/${_pipname::1}/${_pipname}/${_pipname}-${pkgver}.tar.gz")
sha256sums=('42c28d62b525c7eea97e3f15acbc070a3f37a1f0f640a545111c02c3f3a11117')

build() {
	cd "${srcdir}"/${_pipname}-${pkgver}
	ls -la
	python setup.py build
}

package() {
	echo "https://files.pythonhosted.org/packages/source/${_pipname::1}/${_pipname}/${_pipname}-${pkgver}.tar.gz"
	cd "${srcdir}"/${_pipname}-${pkgver}
	python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
