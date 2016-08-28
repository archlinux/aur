_pkgname=frida
pkgname=python-$_pkgname
pkgver=7.3.4
pkgrel=1
pkgdesc="Inject JavaScript to explore native apps on Windows, Mac, Linux, iOS and Android. Python 3 version from PyPi"
arch=('any')
url="http://www.frida.re"
license=('custom:wxWindows Library License, Version 3.1')
depends=('python' 'python-pygments>=2.0.2' 'python-prompt_toolkit>=0.57' 'python-colorama>=0.2.7')
source=("https://pypi.python.org/packages/38/bf/c5bf045c35b74781e2c0df679c4c02f38da32563abf8df6c5d67e70b2c63/frida-${pkgver}.zip")
sha512sums=('f2928a746024790b1436948c398a65e4da02cac3d5df2a693a9cd2a32380dff79d27965f8164b2c8042a3eda68b721580f4b40143be3859a06cb576a605bb4f1')
conflicts=("python2-${_pkgname}")

build() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py install --root=$pkgdir --optimize=1 --skip-build
}
