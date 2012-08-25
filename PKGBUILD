# Maintainer: Thomas Weißschuh <thomas_weissschuh lavabit com>

pkgname=boinc_curses
pkgver=0.2.2
pkgrel=3
pkgdesc="console based boinc-client monitor and controller"
arch=('i686' 'x86_64')
url="http://www.oook.cz/bsd/boinc_curses/"
license=('GPL')
depends=(boinc)
source=("http://www.oook.cz/bsd/$pkgname/$pkgname-$pkgver.tar.bz2")

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make BOINC_HOME=/var/lib/boinc \
       BOINCINCDIR=/usr/include/boinc \
       BOINCLIBDIR=/usr/lib
}

package() {
  install -D -m755 "$srcdir/$pkgname-$pkgver/$pkgname" "$pkgdir/usr/bin/$pkgname"
}

sha512sums=('78a480f3b077a642c3b5592a46f5521cb25f9dec3d5e19b58138b08b2b92fc9648de5e3214bc7e52a87006c7abe3340eaf4f58399d65747b437113a44933ebfd')
