# Contributor: David Vachulka <arch_dvx@users.userforge.net>

pkgname=dxirc
pkgver=1.10.0
pkgrel=3
pkgdesc="A simple IRC client"
arch=('i686' 'x86_64')
url="http://dxirc.org"
license=("GPL")
depends=("fox" "lua51")
source=(http://dxirc.googlecode.com/files/$pkgname-$pkgver.tar.gz)
md5sums=('59d066a7ae7de1f4f16df5856561a5b2')

build() {
  cd $srcdir/$pkgname-$pkgver
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make DESTDIR="$pkgdir/" install
}
