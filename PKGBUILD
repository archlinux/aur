# Maintainer: evertonstz

pkgname=pyautobrightness
_pypiname=pyautobrightness
pkgver=0.2.2
pkgrel=3
pkgdesc='Pyautobrightness is a very simple "Calise like" program, wrote in python 3, designed to change the screen brightness using the webcam as "light sensor".'
arch=('any')
url="https://github.com/evertonstz/py-auto-brightness"
license=('GPL')
depends=('python3' 'python-numpy' 'python-pygame' 'xorg-xbacklight' 'python-pillow')
makedepends=('python3')
source=("https://pypi.python.org/packages/source/p/${_pypiname}/${_pypiname}-${pkgver}.tar.gz")
md5sums=('112223a5d03062ba5284816a0d47317c')

build() {
	cd "${srcdir}/${_pypiname}-${pkgver}"
	python3 setup.py build
}

package() {
  cd "${srcdir}/${_pypiname}-${pkgver}"
  #python3 setup.py install --root="${pkgdir}/" --optimize=1
  python3 setup.py install --root=${pkgdir} --optimize=1
}
