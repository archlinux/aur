# Maintainer: Jonian Guveli <https://github.com/jonian/>
pkgname=overmind-bin
pkgver=2.3.0
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
sha256sums=('d6a715c0810ceb39c94bf61843befebe04a83a0469b53d6af0a52e2fea4e2ab3')

prepare() {
  gzip -d --force "$pkgname-$pkgver.gz"
}

package() {
  install -Dm755 "$srcdir/$pkgname-$pkgver" "$pkgdir/opt/overmind/overmind"
  install -d "$pkgdir/usr/bin" && ln -s "/opt/overmind/overmind" "$_/overmind"
}
