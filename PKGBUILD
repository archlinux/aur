# Maintainer: Lukasz Pozarlik <lpozarlik@gmail.com>

_name="workalendar"
_module="$_name"

pkgname=("python-$_module")
pkgdesc="Worldwide holidays and working days helper and toolkit"
pkgver="16.3.0"
pkgrel=1
url="https://github.com/novafloss/workalendar"
license=('MIT')
arch=('any')
makedepends=("python-pbr>=1.9")
source=("https://github.com/novafloss/workalendar/archive/${pkgver}.tar.gz")
sha256sums=('0c3e0ad5f0b2c5403cdde31a4af3e7856f8bc67fe9447400abc49f612628d2fb')

build() {
  cd "$_name-$pkgver"
  python setup.py build
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

# vim: ts=2 sw=2 et
