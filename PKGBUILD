# Maintainer: Olaf Leidinger <oleid@mescharet.de>
pkgname=futhark-nightly
pkgver=0.99.r6719f9a
pkgrel=1
pkgdesc="A data-parallel functional programming language"
arch=('x86_64')
url="https://github.com/HIPERFIT/futhark"
license=('ISC')
groups=()
depends=()
makedepends=() 
provides=("${pkgname%-nightly}")
conflicts=("${pkgname%-nightly}")
source=("https://futhark-lang.org/releases/futhark-nightly-linux-x86_64.tar.xz")
sha256sums=(SKIP)

pkgver() {
  cd "futhark-nightly-linux-x86_64"
  printf "0.99.r%s" "$(cat commit-id)"
}

package() {
	cd "$srcdir/futhark-nightly-linux-x86_64"
	make PREFIX="$pkgdir/usr" install
}
