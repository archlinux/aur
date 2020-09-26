
# Maintainer: Jack Johannesen <jack AT insertdomain DOT name>

pkgname="freshfetch-git"
pkgver=0.1.2
pkgrel=3
pkgdesc="A fresh take on Neofetch"
arch=('any')
url="https://github.com/K4rakara/freshfetch"
license=('MIT')
depends=('luajit')
makedepends=('cargo' 'git')
optdepends=('xorg-xrandr' 'xorg-xwininfo')
provides=('freshfetch')
conflicts=('freshfetch')
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

