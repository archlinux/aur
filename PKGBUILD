#
# PKGBUILD for fastforward
#
# Contributor: Uffe Jakobsen <microtop@starion.dk>
# Maintainer: Uffe Jakobsen <microtop@starion.dk>
#
pkgname=view64
pkgver=1.58
pkgrel=1
epoch=
pkgdesc="SDL image viewer for Commodore C64 image formats"
arch=('i686' 'x86_64')
url="http://view64.sourceforge.net/"
license=('GPL2')
groups=()
depends=('sdl2')
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=(http://sourceforge.net/projects/view64/files/source/$pkgname-$pkgver-src.zip)
#        fastforward-cc-conf.patch)
noextract=()
md5sums=('6152ba352459cefdbb3097bc443abff5')
#         '7c6ebb4e2e514bebc11296f0a2ee80eb')

prepare() {
  cd "$srcdir/$pkgname-$pkgver-src"
  #patch -p1 -i "$srcdir/fastforward-cc-conf.patch"
}

build() {
  cd "$srcdir/$pkgname-$pkgver-src"
  ###make lib${pkgname}.so
  make
}

check() {
  cd "$srcdir/$pkgname-$pkgver-src"
}

package() {
  cd "$srcdir/$pkgname-$pkgver-src"
  install -d -m 755 "$pkgdir/usr/local/bin/"
  install -d -m 755 "$pkgdir/usr/local/etc/"
  install -d -m 755 "$pkgdir/usr/local/doc/$pkgname/"
  install -m 755 view64 "$pkgdir/usr/local/bin/"
  install -m 644 view64.conf "$pkgdir/usr/local/etc/"
  install -m 644 magic "$pkgdir/usr/local/etc/magic.$pkgname"
  install -m 644 mailcap "$pkgdir/usr/local/etc/mailcap.$pkgname"
  install -m 644 README "$pkgdir/usr/local/doc/$pkgname/"
  install -m 644 README.html "$pkgdir/usr/local/doc/$pkgname/"
}

# EOF
