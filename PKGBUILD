# Maintainer: Anthony VB <anthonyvbop AT gmail DOT com>

pkgname=python-blinkstick-git
_name=blinkstick
pkgver=1.1.8
pkgrel=1
pkgdesc="BlinkStick Python interface to control devices connected to the computer."

url='http://www.blinkstick.com'
arch=('any')
license=('custom')
depends=('python-pyusb')

source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
source=("$_name::git+https://github.com/arvydas/blinkstick-python.git")
sha256sums=('SKIP')


build() {
  cd "${srcdir}/${_name}"
  python setup.py build
}

package() {
  cd "${srcdir}/${_name}"
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
  install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
