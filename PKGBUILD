
# Maintainer: Jack Johannesen <jack AT insertdomain DOT name>

pkgname="freshfetch-git"
pkgver=0.1.1
pkgrel=2
pkgdesc="A fresh take on Neofetch"
arch=('any')
url="https://github.com/K4rakara/freshfetch"
license=('MIT')
depends=('libcpuid' 'libxcb' 'luajit')
makedepends=('cargo' 'git')
provides=('freshfetch')
# I'll eventually make an AUR package called `freshfetch` that conflicts with
# this and just installs the tar.gz once I have one set up.
conflicts=()
source=('git://github.com/K4rakara/freshfetch.git')
md5sums=('SKIP')

build() {
  cd "$srcdir/freshfetch/";
  cargo build \
    --release \
	--locked \
	-vv;
}

package() {
  install -Dm 755 "$srcdir/${pkgname//-git}/target/release/${pkgname//-git}" -t "$pkgdir/usr/bin";
}

