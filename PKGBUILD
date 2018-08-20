# Maintainer: Lukasz Pozarlik <lpozarlik@gmail.com>

_name="workalendar"
_module="$_name"

pkgname=("python-$_module" "python2-$_module")
pkgdesc="Worldwide holidays and working days helper and toolkit"
pkgver="2.5.0"
pkgrel=2
url="https://github.com/novafloss/workalendar"
license=('MIT')
arch=('any')
makedepends=("python-pbr>=1.9" "python2-pbr>=1.9")
source=("https://github.com/novafloss/workalendar/archive/${pkgver}.tar.gz")
sha256sums=('1f194ae47e8ea921bc4e3d746d4901ee6448fec133a53d9ca9c96e75eda7f1e6')

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
