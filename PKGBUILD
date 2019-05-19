# Maintainer: Lukasz Pozarlik <lpozarlik@gmail.com>

_name="workalendar"
_module="$_name"

pkgname=("python-$_module" "python2-$_module")
pkgdesc="Worldwide holidays and working days helper and toolkit"
pkgver="4.4.0"
pkgrel=1
url="https://github.com/novafloss/workalendar"
license=('MIT')
arch=('any')
makedepends=("python-pbr>=1.9" "python2-pbr>=1.9")
source=("https://github.com/novafloss/workalendar/archive/${pkgver}.tar.gz")
sha256sums=('2c8f7716e01e543ac097956070b12faeb2e2caa3433a7dd5ca34128f0bcd75aa')

build() {
  cd "$_name-$pkgver"
  python setup.py build
  python2 setup.py build
}

package_python-workalendar(){
  depends=('python-lunardate'
           'python-pycalverter'
           'python-pytz'
           'python-dateutil'
           'python-pyephem')

  cd "$_name-$pkgver"
  python setup.py install --root="${pkgdir}/" --optimize=1
  install -D --mode 644 --target-directory "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}

package_python2-workalendar(){
  depends=('python2-lunardate'
           'python2-pycalverter'
           'python2-pytz'
           'python2-dateutil'
           'python2-pyephem')

  cd "$_name-$pkgver"
  python2 setup.py install --root="${pkgdir}/" --optimize=1
  install -D --mode 644 --target-directory "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}

# vim: ts=2 sw=2 et
