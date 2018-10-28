# Maintainer: Jonian Guveli <https://github.com/jonian/>
pkgname=overmind-bin
pkgver=2.0.0.beta1
pkgrel=1
pkgdesc="Overmind is a process manager for Procfile-based applications and tmux."
arch=("x86_64")
url="https://github.com/DarthSim/overmind"
license=("MIT")
provides=("overmind")
conflicts=("overmind" "overmind-git")
depends=("tmux")
source=("$pkgname-$pkgver.gz::$url/releases/download/v$pkgver/overmind-v$pkgver-linux-amd64.gz")
md5sums=("63c56f38649ef739e5cf3d421224bded")

package() {
  install -Dm755 "$srcdir/$pkgname-$pkgver" "$pkgdir/opt/$pkgname/overmind"
  install -d "$pkgdir/usr/bin" && ln -s "/opt/$pkgname/overmind" "$_/overmind"
}
