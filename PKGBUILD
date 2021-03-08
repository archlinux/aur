_pipname=yamk
pkgname="python-${_pipname}"
pkgver=1.2.0
pkgrel=1
pkgdesc="Yet another make"
arch=('any')
url="https://github.com/spapanik/yamk"
license=('MIT')
depends=('python-tomlkit')
source=("https://files.pythonhosted.org/packages/source/${_pipname::1}/${_pipname}/${_pipname}-${pkgver}.tar.gz")
sha512sums=('0484408f2c71a3d770977ca794b4046d01944d167aece9172fd5c1def5af5cb2034a3566bc28828d41e54e535817c3ea51f3e63fcef7e80355e2d02f29a3ec77')

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
