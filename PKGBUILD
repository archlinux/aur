# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Daniel Wallace <danielwallace at gtmanfred dot com>
# Contributor: Thomas S Hatch <thatch45@gmail.com>

pkgname=python-unittest-xml-reporting
pkgver=3.2.0
pkgrel=1
pkgdesc='unittest-based test runner with Ant/JUnit like XML reporting.'
arch=('any')
url='https://github.com/xmlrunner/unittest-xml-reporting'
license=('BSD')
depends=('python-lxml')
makedepends=('python-setuptools')
source=("https://github.com/xmlrunner/unittest-xml-reporting/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('ea8b6c7d3b7995fc1750b14ca76987ff3525993be91c86e401bcfd233d4d02d629d4fa50fc7de79cade39ed4d6c9749becee279ae68c4ed90747e3d3940ab898')

build() {
  cd unittest-xml-reporting-$pkgver
  python setup.py build
}

check() {
  cd unittest-xml-reporting-$pkgver
  python setup.py test
}

package() {
  cd unittest-xml-reporting-$pkgver
  python setup.py install --root="$pkgdir" -O1

  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/

  # Broken data_files
  rm "$pkgdir"/usr/LICENSE
}
