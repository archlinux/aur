# Maintainer: Melvin Vermeeren <mail@mel.vin>

_name=sphinx-multibuild
pkgname=("python-${_name}" "python2-${_name}")
pkgver=1.1.1
pkgrel=1
pkgdesc="Allow sphinx to build with multiple source directories and watch for changes."
arch=('any')
url="https://github.com/rowanG077/sphinx-multibuild"
license=('MIT')
makedepends=('python' 'python-setuptools' 'python2' 'python2-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('60e7f1ad87f585ecf323396cc43337ca6a39c275a412ce0d391d4adaa12b8a2d')

prepare() {
	cd "$_name-$pkgver"

	cp -a "${srcdir}/$_name-$pkgver" "${srcdir}/${_name}2-$pkgver"
}

package_python-sphinx-multibuild() {
	depends=('python' 'python-setuptools' 'python-watchdog' 'python-sphinx')

	cd "$_name-$pkgver"
	python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1
}

package_python2-sphinx-multibuild() {
	depends=('python2' 'python2-setuptools' 'python2-watchdog' 'python2-sphinx')

	cd "${_name}2-$pkgver"
	python2 setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1
}
