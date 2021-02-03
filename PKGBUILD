# Contributor: Richard PALO <richard.palo@free.fr>
pkgname=python-tryton
pkgver=5.8.3
pkgrel=1
pkgdesc="Tryton desktop client"
arch=('any')
url="http://www.tryton.org/"
license=('GPL3')
makedepends=('python-setuptools')
depends=('python-cairo' 'python-dateutil' 'python-gobject')
optdepends=('python-goocalendar>=0.7: calendar support')
source=("https://pypi.io/packages/source/t/tryton/tryton-$pkgver.tar.gz")
sha512sums=('95fa5888dddfe531953093cac0f4cfbcdf50a65f21cfd5aab2ee0ebe4bfb00fb992c9ead49439eccce57876dedc6b6370ab4785914f170fee749bbc8e82dca70')

package_python-tryton() {
  cd "$srcdir/tryton-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
  install -Dm644 "tryton.desktop" -t "${pkgdir}/usr/share/applications"
  install -Dm644 "tryton/data/pixmaps/tryton/tryton-icon.png" "$pkgdir/usr/share/pixmaps/tryton-icon.png"
}
