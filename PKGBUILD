# Contributor: Richard PALO <richard.palo@free.fr>
pkgname=python-tryton
pkgver=5.8.2
pkgrel=1
pkgdesc="Tryton desktop client"
arch=('any')
url="http://www.tryton.org/"
license=('GPL3')
makedepends=('python-setuptools')
depends=('python-cairo' 'python-dateutil' 'python-gobject')
optdepends=('python-goocalendar>=0.7: calendar support')
source=("https://pypi.io/packages/source/t/tryton/tryton-$pkgver.tar.gz")
sha512sums=('fa93da868935a257b9f659507e4e16f8a363bcb915ad96e64e64b318c6cd4c0ef87acaf3f73005e7db90cc41144d03f9346b32001faf276e06960661247c4bb1')

package_python-tryton() {
  cd "$srcdir/tryton-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
  install -Dm644 "tryton.desktop" -t "${pkgdir}/usr/share/applications"
  install -Dm644 "tryton/data/pixmaps/tryton/tryton-icon.png" "$pkgdir/usr/share/pixmaps/tryton-icon.png"
}
