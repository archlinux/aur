# Maintainer: Jonian Guveli <https://github.com/jonian/>
pkgname=overmind-bin
pkgver=2.4.0
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
sha256sums=('1f7cac289b550a71bebf4a29139e58831b39003d9831be59eed3e39a9097311c')

prepare() {
  gzip -d --force "$pkgname-$pkgver.gz"
}

package() {
  install -Dm755 "$srcdir/$pkgname-$pkgver" "$pkgdir/opt/overmind/overmind"
  install -d "$pkgdir/usr/bin" && ln -s "/opt/overmind/overmind" "$_/overmind"
}
