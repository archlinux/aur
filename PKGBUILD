# Maintainer: Daniel Gustaw <gustaw.daniel@gmail.com>
pkgname=ranwhen
pkgver=0.2.2
pkgrel=1
pkgdesc="Visualize when your system was running (precompiled binary with macOS and Linux support)"
arch=('x86_64' 'aarch64')
url="https://github.com/gustawdaniel/ranwhen"
license=('GPL-3.0-or-later')
depends=('gcc-libs')
provides=('ranwhen')
conflicts=('ranwhen-git')
source_x86_64=("$url/releases/download/v$pkgver/ranwhen-v$pkgver-x86_64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('fa439a89300debe8e2de77bebf7b136809ad6fb7cfeb9fd3809f79ba52aa22a1')
source_aarch64=("$url/releases/download/v$pkgver/ranwhen-v$pkgver-aarch64-unknown-linux-gnu.tar.gz")
sha256sums_aarch64=('b4cec87b576760694f61eabd5289c8ed8eba061d3e798130da323c27f0f05e1b')

package() {
  install -Dm755 "$srcdir/ranwhen-v$pkgver-$CARCH-unknown-linux-gnu/ranwhen" "$pkgdir/usr/bin/ranwhen"
  install -Dm644 "$srcdir/ranwhen-v$pkgver-$CARCH-unknown-linux-gnu/README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
}
