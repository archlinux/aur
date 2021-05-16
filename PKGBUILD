# Contributor: Richard PALO <richard.palo@free.fr>
pkgname=python-tryton
pkgver=5.8.9
pkgrel=1
pkgdesc="Tryton desktop client"
arch=('any')
url="http://www.tryton.org/"
license=('GPL3')
makedepends=('python-setuptools')
depends=('python-cairo' 'python-dateutil' 'python-gobject')
optdepends=('python-goocalendar>=0.7: calendar support')
source=("https://pypi.io/packages/source/t/tryton/tryton-$pkgver.tar.gz")
sha512sums=('2460fee42dccd40555d0230d8415359777c9d22e68835a54629b7ac42292e4b6b08c5febd9301ebb595194087a14188eedf0ce317da27b0976d0c612023f30b5')

package_python-tryton() {
  cd "$srcdir/tryton-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
  install -Dm644 "tryton.desktop" -t "${pkgdir}/usr/share/applications"
  install -Dm644 "tryton/data/pixmaps/tryton/tryton-icon.png" "$pkgdir/usr/share/pixmaps/tryton-icon.png"
}
