# Maintainer: Jonian Guveli <https://github.com/jonian/>
pkgname=overmind-bin
pkgver=2.0.2
pkgrel=2
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
md5sums=("4ecb3778baa79a1053b29eb85200758d")

prepare() {
  gzip -d --force "$pkgname-$pkgver.gz"
}

package() {
  install -Dm755 "$srcdir/$pkgname-$pkgver" "$pkgdir/opt/$pkgname/overmind"
  install -d "$pkgdir/usr/bin" && ln -s "/opt/$pkgname/overmind" "$_/overmind"
}
