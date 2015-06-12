# Maintainer: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@member.fsf.org>

pkgname=jlibgamma
pkgver=1.0.1
pkgrel=1
pkgdesc="Display server abstraction layer for gamma ramps and Java"
arch=(i686 x86_64)
url="https://github.com/maandree/jlibgamma"
license=('GPL3')
depends=('java-runtime-headless>=1.5' 'libgamma>=0.3' glibc)
makedepends=('java-environment>=1.5' 'libgamma>=0.3' glibc gcc make coreutils sed)
source=($url/archive/$pkgver.tar.gz)
sha256sums=(b2b4fff21270162a7faa3cc95f511261acf128a28e35f24c6c24a1b8492bb175)


build() {
  cd "$srcdir/$pkgname-$pkgver"
  make PREFIX=/usr JAVA_HOME=/usr/lib/jvm/default
}


package() {
  cd "$srcdir/$pkgname-$pkgver"
  make PREFIX=/usr JAVA_HOME=/usr/lib/jvm/default install DESTDIR="$pkgdir"
}

