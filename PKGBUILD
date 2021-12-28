# Maintainer: Łukasz Pożarlik <lpozarlik@gmail.com>

pkgname=('python-timezonefinder')
pkgdesc="Fast and lightweight project for looking up the timezone for a given lat/lng"
pkgver=5.2.0
pkgrel=1
url="https://github.com/MrMinimal64/timezonefinder"
license=('MIT')
arch=('any')
makedepends=('python' 
  'python-setuptools')
source=("https://files.pythonhosted.org/packages/source/t/timezonefinder/timezonefinder-${pkgver}.tar.gz")
sha256sums=('a374570295a8dbd923630ce85f754e52578e288cb0a9cf575834415e84758352')

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

