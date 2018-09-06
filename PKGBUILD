# Maintainer: ist <ikersanditrejo@gmail.com>
pkgname=torphantom
pkgver=0.9
pkgrel=1
pkgdesc="A fork of TorGhost, a little utilitly used to route all traffic through TOR. This script spoofs your mac address, and then routes all traffic through the TOR network. It is currently a WIP.."
arch=('i686' 'x86_64' 'armv7h' 'armv6h' 'aarch64')
url="https://github.com/3ndG4me/torphantom"
license=('GPL3')
depends=(
  'macchanger'
  'tor'
)
source=("git+https://github.com/3ndG4me/torphantom.git")
md5sums=('SKIP')

prepare (){
  if [ -e  "$srcdir/$pkgname-$pkgver" ]
  then
    rm -r "$srcdir/$pkgname-$pkgver"
  fi
  mkdir "$srcdir/$pkgname-$pkgver"
  mv "$srcdir/torphantom/Linux/torphantom-arch" "$srcdir/$pkgname-$pkgver"
}

build() {
  cd "$srcdir/$pkgname-$pkgver"
  mkdir -p usr/bin/
  chmod +x torphantom-arch
  mv torphantom-arch usr/bin/torphantom
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  mv usr "$pkgdir/"
}
