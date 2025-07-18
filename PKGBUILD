pkgname='stam'
_pkgname='stam-tools'
pkgver="0.11.0"
pkgrel=1
arch=('x86_64' 'i686')
url="https://annotation.github.io/stam"
pkgdesc="Command line tools for working with stand-off annotations on text"
license=('GPL-3.0-only')
depends=()
makedepends=('rust' 'cargo' 'git')
checkdepends=()
provides=('stam')
conflicts=('stam')
source=("$_pkgname::https://github.com/annotation/$_pkgname/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('bed75ad53d9097a85e96d82d1e58c01063ae993e899e20df7515171a73085a5c')

build(){
  cd $srcdir/$_pkgname-$pkgver
  cargo build --release
}

package() {
    cd $srcdir/$_pkgname-$pkgver

	install -D -m755 "target/release/stam" "$pkgdir/usr/bin/stam"
}

