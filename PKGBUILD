# Contributor: Richard PALO <richard.palo@free.fr>
pkgname=python-goocalendar
pkgver=0.7.1
pkgrel=1
pkgdesc="A calendar widget for GTK using PyGoocanvas"
arch=('any')
url="http://goocalendar.tryton.org/"
license=('GPL')
makedepends=('python-setuptools')
depends=('goocanvas' 'goocanvas>=2.0' 'gdk-pixbuf2' 'gtk3')
source=("https://pypi.io/packages/source/g/goocalendar/GooCalendar-$pkgver.tar.gz")
sha512sums=('1b35e9e831ac88b3b11fdc4c0ae25179a76631ff9525a837347e34b6e33bfc22ff77cb266f5c02432d0c1c1c12247d8ec2a602af81874163b11375c8d5f02616')

build() {
  cd "$srcdir/GooCalendar-$pkgver"
  python setup.py build
}

package() {

  cd "$srcdir/GooCalendar-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
