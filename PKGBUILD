# Contributor: Richard PALO <richard.palo@free.fr>
pkgname=python-goocalendar
pkgver=0.8.0
pkgrel=1
pkgdesc="A calendar widget for GTK using PyGoocanvas"
arch=('any')
url="http://goocalendar.tryton.org/"
license=('GPL')
makedepends=('python-setuptools')
depends=('goocanvas>=2.0' 'gdk-pixbuf2' 'gtk3')
source=("https://pypi.io/packages/source/g/goocalendar/GooCalendar-$pkgver.tar.gz")
sha512sums=('92828ecfd3e5124249c807c53cb8b8ca2a4f146f676033b1a172a0fac415ff444d57c5c4de77e55046657b0c6f675902b408b205ad7125d6459c7babead871fa')

build() {
  cd "$srcdir/GooCalendar-$pkgver"
  python setup.py build
}

package() {

  cd "$srcdir/GooCalendar-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
