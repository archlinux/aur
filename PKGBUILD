# Contributor: Richard PALO <richard.palo@free.fr>
pkgname=python-tryton
pkgver=5.8.5
pkgrel=1
pkgdesc="Tryton desktop client"
arch=('any')
url="http://www.tryton.org/"
license=('GPL3')
makedepends=('python-setuptools')
depends=('python-cairo' 'python-dateutil' 'python-gobject')
optdepends=('python-goocalendar>=0.7: calendar support')
source=("https://pypi.io/packages/source/t/tryton/tryton-$pkgver.tar.gz")
sha512sums=('3a663e53a908be9c4905675b640088291561596b0f15f70b00ed243c0e054b54ffb9fd84e5ddc905cd81607f2c4134bda19f0a7ce243a24803dfa6b16f9b843e')

package_python-tryton() {
  cd "$srcdir/tryton-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
  install -Dm644 "tryton.desktop" -t "${pkgdir}/usr/share/applications"
  install -Dm644 "tryton/data/pixmaps/tryton/tryton-icon.png" "$pkgdir/usr/share/pixmaps/tryton-icon.png"
}
