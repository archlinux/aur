_pipname=yamk
pkgname="python-${_pipname}"
pkgver=2.4.1
pkgrel=2
pkgdesc="Yet another make"
arch=('any')
url="https://github.com/spapanik/yamk"
license=('LGPL3')
depends=('python-tomli' 'python-yaml' 'python-dj-settings')
source=("https://files.pythonhosted.org/packages/source/${_pipname::1}/${_pipname}/${_pipname}-${pkgver}.tar.gz")
sha256sums=('b6ec4aaf64ec7972e0cdeff9ca5f0f4e67618893f40a99032c0064d2ed021dbd')

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
