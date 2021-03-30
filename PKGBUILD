# Contributor: Richard PALO <richard.palo@free.fr>
pkgname=python-goocalendar
pkgver=0.7.2
pkgrel=1
pkgdesc="A calendar widget for GTK using PyGoocanvas"
arch=('any')
url="http://goocalendar.tryton.org/"
license=('GPL')
makedepends=('python-setuptools')
depends=('goocanvas>=2.0' 'gdk-pixbuf2' 'gtk3')
source=("https://pypi.io/packages/source/g/goocalendar/GooCalendar-$pkgver.tar.gz")
sha512sums=('beae60423de205dfa4bc9c7dbd5c10903ac644abc452f72728eb4ae9581a7415950eadcacb569df805efb1be608a29977bc98d674f23fd131504e4adfc9961f9')

build() {
  cd "$srcdir/GooCalendar-$pkgver"
  python setup.py build
}

package() {

  cd "$srcdir/GooCalendar-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
