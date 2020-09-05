# Maintainer: Jonian Guveli <https://github.com/jonian/>
pkgname=overmind-bin
pkgver=2.2.0
pkgrel=1
pkgdesc="Overmind is a process manager for Procfile-based applications and tmux"
arch=("x86_64")
url="https://github.com/DarthSim/overmind"
license=("MIT")
provides=("overmind")
conflicts=("overmind" "overmind-git")
depends=("tmux")
makedepends=("gzip")
source=("$pkgname-$pkgver.gz::$url/releases/download/v$pkgver/overmind-v$pkgver-linux-amd64.gz")
noextract=("$pkgname-$pkgver.gz")
md5sums=("d056c4568714412d8b4501b858e15e39")

prepare() {
  gzip -d --force "$pkgname-$pkgver.gz"
}

package() {
  install -Dm755 "$srcdir/$pkgname-$pkgver" "$pkgdir/opt/$pkgname/overmind"
  install -d "$pkgdir/usr/bin" && ln -s "/opt/$pkgname/overmind" "$_/overmind"
}
