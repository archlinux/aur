# Maintainer: a821 at mail de
# Contributor: Steffen Weber <-boenki-gmx-de->
# Contributor: Nick Smallbone <nick.smallbone@gmail.com>

pkgname=tofrodos
pkgver=2.1.0
pkgrel=1
arch=('x86_64')
pkgdesc="Convert ASCII files between the MS-DOS/Windows format and the UNIX format"
url="https://www.thefreecountry.com/tofrodos/"
license=('GPL-2.0-only' 'GPL-3.0-or-later')
depends=('glibc')
source=("$pkgname-$pkgver.tar.gz::https://github.com/ChristopherHeng/tofrodos/archive/$pkgver.tar.gz"
        "Makefile.patch")
sha512sums=('a1d4549f0f226f16a8d248378ed8b34cf6075860db88eca400cef9705cc970d40b444e5e81a59091d11ca03904ceb98dd79f9156e2ebc48b162d0ae52c2cc51e'
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
