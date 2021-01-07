# Maintainer: Łukasz Pożarlik <lpozarlik@gmail.com>

pkgname=('python-timezonefinder')
pkgdesc="Fast and lightweight project for looking up the timezone for a given lat/lng"
pkgver=4.5.0
pkgrel=1
url="https://github.com/MrMinimal64/timezonefinder"
license=('MIT')
arch=('any')
makedepends=('python' 
  'python-setuptools')
source=("https://files.pythonhosted.org/packages/source/t/timezonefinder/timezonefinder-${pkgver}.tar.gz")
sha256sums=('99b0cea5abf304e8738ecf5cceae0c0e5182534843f19638a26a220fa212fbad')

build() {
  cp -r ${srcdir}/timezonefinder-${pkgver} ${srcdir}/timezonefinder-${pkgver}-py2

  cd ${srcdir}/timezonefinder-${pkgver}
  python setup.py build
}

package_python-timezonefinder() {
  depends=('python-numpy')
  cd ${srcdir}/timezonefinder-${pkgver}
  python setup.py install --prefix=/usr --root=${pkgdir}
  install -D --mode 644 --target-directory "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}

# vim:set ts=2 sw=2 et:

