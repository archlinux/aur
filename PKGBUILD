# Maintainer: Jonian Guveli <https://github.com/jonian/>
pkgname=overmind-bin
pkgver=2.5.1
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
sha256sums=('a17159b8e97d13f3679a4e8fbc9d4747f82d5af9f6d32597b72821378b5d0b6f')

prepare() {
  gzip -d --force "$pkgname-$pkgver.gz"
}

package() {
  install -Dm755 "$srcdir/$pkgname-$pkgver" "$pkgdir/opt/overmind/overmind"
  install -d "$pkgdir/usr/bin" && ln -s "/opt/overmind/overmind" "$_/overmind"
}
