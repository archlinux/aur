# Maintainer: a821 at mail de
# Contributor: Steffen Weber <-boenki-gmx-de->
# Contributor: Nick Smallbone <nick.smallbone@gmail.com>

pkgname=tofrodos
pkgver=1.8.4
pkgrel=1
arch=('x86_64')
pkgdesc="Convert ASCII files between the MS-DOS/Windows format and the UNIX format"
url="https://www.thefreecountry.com/tofrodos/"
license=('GPL-2.0-only')
depends=('glibc')
source=("https://www.thefreecountry.com/tofrodos/tofrodos-$pkgver.zip"
        "Makefile.patch")
sha512sums=('c535bfe036fb6a7f3518adc1da9fcb371e823d0315c714b224e2dcead356216aa660b92cf52e8f877d8d10756216fdae12a6c09f758ceeb09ecc14eb95cb83f1'
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
