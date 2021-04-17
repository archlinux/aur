# Contributor: Richard PALO <richard.palo@free.fr>
pkgname=python-tryton
pkgver=5.8.7
pkgrel=1
pkgdesc="Tryton desktop client"
arch=('any')
url="http://www.tryton.org/"
license=('GPL3')
makedepends=('python-setuptools')
depends=('python-cairo' 'python-dateutil' 'python-gobject')
optdepends=('python-goocalendar>=0.7: calendar support')
source=("https://pypi.io/packages/source/t/tryton/tryton-$pkgver.tar.gz")
sha512sums=('b587d8c5ed28bd7b862bb945c29691e989dc687e0ea2d9445180730a1bf9f93da17732cac2832886134ce5b6acc3b5e031feb4b0bb7f39b3b1de94425cee612d')

package_python-tryton() {
  cd "$srcdir/tryton-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
  install -Dm644 "tryton.desktop" -t "${pkgdir}/usr/share/applications"
  install -Dm644 "tryton/data/pixmaps/tryton/tryton-icon.png" "$pkgdir/usr/share/pixmaps/tryton-icon.png"
}
