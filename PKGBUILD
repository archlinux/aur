# Maintainer: Lukasz Pozarlik <lpozarlik@gmail.com>

pkgname=("python-workalendar")
pkgdesc="Worldwide holidays and working days helper and toolkit"
pkgver="17.0.0"
pkgrel=1
url="https://github.com/novafloss/workalendar"
license=('MIT')
arch=('any')
makedepends=("python-pbr>=1.9")
depends=('python-lunardate'
         'python-pytz'
         'python-dateutil'
         'python-pyephem')
source=("https://github.com/novafloss/workalendar/archive/${pkgver}.tar.gz")
sha256sums=('a6bead4be0dfc9f5923221227028b5ba488ce90973d356418cda1859e7f97fa5')

build() {
  cd "workalendar-$pkgver"
  python setup.py build
}

package_python-workalendar(){
  cd "workalendar-$pkgver"
  python setup.py install --root="${pkgdir}/" --optimize=1
  install -D --mode 644 --target-directory "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}

# vim: ts=2 sw=2 et
