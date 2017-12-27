pkgbase=python-rpi.gpio
pkgname=('python-rpi.gpio' 'python2-rpi.gpio')
pkgver=0.6.3
pkgrel=1
pkgdesc="A module to control Raspberry Pi GPIO channels"
url="http://sourceforge.net/projects/raspberry-gpio-python/"
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h' 'aarch64')
license=('MIT')
makedepends=('python-setuptools' 'python2-setuptools')
source=("https://pypi.python.org/packages/e2/58/6e1b775606da6439fa3fd1550e7f714ac62aa75e162eed29dbec684ecb3e/RPi.GPIO-0.6.3.tar.gz")
md5sums=('e4abe1cfb5eacebe53078032256eb837')

build() {
  cp -r "${srcdir}"/RPi.GPIO-$pkgver "${srcdir}"/RPi.GPIO-$pkgver-py2

  cd "${srcdir}"/RPi.GPIO-$pkgver
  python setup.py build

  cd "${srcdir}"/RPi.GPIO-$pkgver-py2
  python2 setup.py build
}

package_python-rpi.gpio() {
  depends=('python')

  cd "${srcdir}/RPi.GPIO-$pkgver"
  python setup.py install --root=${pkgdir} --optimize=1
}

package_python2-rpi.gpio() {
  depends=('python2')

  cd "${srcdir}/RPi.GPIO-$pkgver"
  python2 setup.py install --root=${pkgdir} --optimize=1
}

