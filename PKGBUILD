# Maintainer: a821 at mail de
# Contributor: Steffen Weber <-boenki-gmx-de->
# Contributor: Nick Smallbone <nick.smallbone@gmail.com>

pkgname=tofrodos
pkgver=2.0.0
pkgrel=1
arch=('x86_64')
pkgdesc="Convert ASCII files between the MS-DOS/Windows format and the UNIX format"
url="https://www.thefreecountry.com/tofrodos/"
license=('GPL-2.0-only' 'GPL-3.0-or-later')
depends=('glibc')
source=("$pkgname-$pkgver.tar.gz::https://github.com/ChristopherHeng/tofrodos/archive/$pkgver.tar.gz"
        "Makefile.patch")
sha512sums=('079ac292bb32a6ede4465ca71c10444b11b9d08daa6d760b8f155f80a08ff71531cd421c382abf79496572f608f4b9fe6479187fdd2981d59cfb50a462ea14df'
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
