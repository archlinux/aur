# Maintainer: Thomas Ascher <thomas.ascher@gmx.at>
# Contributor: Thomas Ascher <thomas.ascher@gmx.at>
pkgname=gorm
_pkgname=Gorm
pkgrel=1
pkgver=1.2.20
pkgdesc="GNUstep's easy-to-use interface designer."
arch=('i686' 'x86_64')
url="http://www.gnustep.org/experience/$_pkgname.html"
license=('GPL')
install=$pkgname.install
depends=('gnustep-base'
         'gnustep-gui')
makedepends=('gcc-objc'
             'gnustep-make')
source=("ftp://ftp.gnustep.org/pub/gnustep/dev-apps/$pkgname-$pkgver.tar.gz"
        "$pkgname.install")
sha256sums=('1428bee51999e1915017a1d283a6ad73a94cabdddb7a0d5ad0e9f79bec92d6c0'
            'f703f8de14eb277dc72cc837086fbd55f5d772049a44200686c8ae76348f6614')

build() {
  cd "$pkgname-$pkgver"
  make
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
  install -D -m644 "$pkgdir/usr/lib/GNUstep/Applications/$_pkgname.app/Resources/$_pkgname.desktop" \
    "$pkgdir/usr/share/applications/$_pkgname.desktop"
}
