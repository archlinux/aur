# Maintainer: Jonian Guveli <https://github.com/jonian/>
pkgname=hivemind-bin
pkgver=1.0.6
pkgrel=1
pkgdesc="Hivemind is a process manager for Procfile-based applications"
arch=("x86_64")
url="https://github.com/DarthSim/hivemind"
license=("MIT")
provides=("hivemind")
conflicts=("hivemind" "hivemind-git")
makedepends=("gzip")
source=("$pkgname-$pkgver.gz::$url/releases/download/v$pkgver/hivemind-v$pkgver-linux-amd64.gz")
noextract=("$pkgname-$pkgver.gz")
md5sums=("392b126b3f6b984e6cb1ebb9f4f724c9")

prepare() {
  gzip -d --force "$pkgname-$pkgver.gz"
}

package() {
  install -Dm755 "$srcdir/$pkgname-$pkgver" "$pkgdir/opt/$pkgname/hivemind"
  install -d "$pkgdir/usr/bin" && ln -s "/opt/$pkgname/hivemind" "$_/hivemind"
}
