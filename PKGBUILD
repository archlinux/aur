_pkgname=frida
pkgname=python-$_pkgname
pkgver=7.0.11
pkgrel=1
pkgdesc="Inject JavaScript to explore native apps on Windows, Mac, Linux, iOS and Android. Python 3 version from PyPi"
arch=('any')
url="http://www.frida.re"
license=('custom:wxWindows Library License, Version 3.1')
depends=('python' 'python-pygments>=2.0.2' 'python-prompt_toolkit>=0.57' 'python-colorama>=0.2.7')
source=("https://pypi.python.org/packages/source/f/frida/frida-${pkgver}.zip")
sha512sums=('8ba9667e7520f9948f0742a3972d8a73fd46320d3cd0d48042e8b660a15fac418778f1c71543063a73a14404716d2c01a1526390d0bed4771e2feb502f3da4f0')
conflicts=("python2-${_pkgname}")

build() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py install --root=$pkgdir --optimize=1 --skip-build
}
