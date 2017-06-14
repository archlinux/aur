# Maintainer: Lukasz Pozarlik <lpozarlik@gmail.com>

_name="workalendar"
_module="$_name"

pkgname=("python-$_module" "python2-$_module")
pkgdesc="Worldwide holidays and working days helper and toolkit"
pkgver="1.3.0"
pkgrel=1
url="https://github.com/novafloss/workalendar"
license=('MIT')
arch=('any')
makedepends=("python-pbr>=1.9" "python2-pbr>=1.9")
source=("https://github.com/novafloss/workalendar/archive/${pkgver}.tar.gz")
md5sums=('b5d386cb688752e86fca31e96b6013ae')

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
