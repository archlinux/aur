# Maintainer: a821 at mail de
# Contributor: Steffen Weber <-boenki-gmx-de->
# Contributor: Nick Smallbone <nick.smallbone@gmail.com>

pkgname=tofrodos
pkgver=1.8.3
pkgrel=1
arch=('x86_64')
pkgdesc="Convert ASCII files between the MS-DOS/Windows format and the UNIX format"
url="https://www.thefreecountry.com/tofrodos/"
license=('GPL-2.0-only')
depends=('glibc')
source=("https://www.thefreecountry.com/tofrodos/tofrodos-$pkgver.zip"
        "Makefile.patch")
sha512sums=('aa80675a1277ee7575c0469be868825bffb5f938ceddb99d9c21b93b7e46793d754285f2cf6b8c8e5020c0c0596de3981f15fb2731b59539c78f82308f3644fa'
            '815eda271724b19800a010a189feb55696f3170e6df29cfddd81f4a9502b35fb758fe33983e5df65bb0799393c60566ea58d6c647bed0b86a402db088cfc4848')

prepare() {
  patch src/Makefile < Makefile.patch
}

build() {
  make -C src
}

package() {
  make -C src DESTDIR="$pkgdir" install
}
