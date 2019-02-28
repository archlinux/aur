# Maintainer: Sven-Hendrik Haase <svenstaro@gmail.com>

pkgname=miniserve
pkgver=0.3.1
pkgrel=1
pkgdesc="Tool to serve files via HTTP"
arch=('x86_64')
url="https://github.com/svenstaro/miniserve"
license=(MIT)
makedepends=(cargo)
source=(https://github.com/svenstaro/miniserve/archive/v${pkgver}.tar.gz)
sha512sums=('635e14d5baadb791df65f4549961b6ea9093f6bbecc57453fda2606cb7f33d003051e6af8757c1784809b18e0f27c70d1079c2a43638a4860a34d460b5ade320')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  cargo build --release --locked
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  install -Dm755 target/release/miniserve "$pkgdir"/usr/bin/miniserve
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

# vim:set ts=2 sw=2 et:
