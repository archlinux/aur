# Maintainer: willemw <willemw12@gmail.com>
# Contributor: Alexander De Sousa <archaur.xandy21@spamgourmet.com>
# Contributor: Jeff Mickey <j@codemac.net>

pkgname=speedometer
pkgver=2.8
pkgrel=3
pkgdesc="Measure and display the rate of data across a network connection or data being stored in a file"
arch=('any')
url="http://excess.org/speedometer/"
license=('GPL')
depends=('python2-urwid')
makedepends=('python2-setuptools')
source=(http://excess.org/$pkgname/$pkgname-$pkgver.tar.gz)
md5sums=('aa52b9253117523202d6ec8c110344ef')
sha1sums=('70546d98486a42a0eaee0393025e0cea2cb6fe5f')

package() {
  cd $pkgname-$pkgver

  python2 setup.py install --root="$pkgdir/" #--optimize=1

  mv "$pkgdir"/usr/bin/speedometer{.py,}
  rm -r "$pkgdir/usr/lib/"
}

