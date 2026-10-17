# Maintainer: a821 at mail de
# Contributor: Steffen Weber <-boenki-gmx-de->
# Contributor: Nick Smallbone <nick.smallbone@gmail.com>

pkgname=tofrodos
pkgver=3.0.0
pkgrel=1
arch=('x86_64')
pkgdesc="Convert ASCII files between the MS-DOS/Windows format and the UNIX format"
url="https://github.com/ChristopherHeng/tofrodos"
license=('GPL-2.0-only' 'GPL-3.0-or-later')
depends=('glibc')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz"
        "Makefile.patch")
sha512sums=('82b429625b92cde6b72bb382e37576a792ddf7f9dc8be640f771a73b52f6502b7d3c41618ce9631d10df3cf5b0d8e08c46b1f83c018250f692556621b4d4d215'
            'a6a0eb4ec31cb8a66b5146b6971254437a52d4df775749228679eb3dd0da5dbcfe472cb7a83a1a8ca30e0f6d08f06e5481148f988a4306d43837f740099de839')

prepare() {
  cd $pkgname-$pkgver
  patch -p1 < ../Makefile.patch
}

build() {
  make -C $pkgname-$pkgver
}

package() {
  make -C $pkgname-$pkgver DESTDIR="$pkgdir" install
}
