# Maintainer: Mike Swanson <mikeonthecomputer@gmail.com>
pkgname=disorderfs
pkgver=0.5.2
pkgrel=1
pkgdesc="FUSE filesystem that introduces nondeterminism"
arch=('x86_64')
url="https://reproducible-builds.org/"
license=('GPL3')
depends=('fuse')
makedepends=('asciidoc')
source=("https://deb.debian.org/debian/pool/main/d/${pkgname}/${pkgname}_${pkgver}.orig.tar.bz2")
sha512sums=('61ebc7133149c5c8db15c1c1f317f04f29cd6ddd5fa8fd3740c7ed3062901a2eb7a86542e72f0954bfc5ecd6a9ae4b13018f6fe393052751d34c1ae7b3f36eb9')

build() {
  cd $pkgname-$pkgver

  make
}

package() {
  cd $pkgname-$pkgver

  make DESTDIR="$pkgdir/" PREFIX=/usr install
}
