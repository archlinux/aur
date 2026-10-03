# Maintainer: Allie Bayless <drbayless@gmail.com>
#
# Generated from packaging/aur/PKGBUILD.in by packaging/aur/render-pkgbuild.sh.
# Edit the template in the rigwatch repository, not this file.

pkgname=rigwatch-bin
pkgver=0.0.22
pkgrel=1
pkgdesc="Live terminal dashboard for CPU, GPU, RAM and disk on your servers, over SSH"
arch=('x86_64' 'aarch64')
url="https://github.com/allisonhere/rigwatch"
license=('MIT')
provides=("rigwatch=$pkgver")
conflicts=('rigwatch' 'rigwatch-git')
# Upstream ships a static, already-stripped binary; re-stripping it only
# produces an empty debug package.
options=('!strip' '!debug')

source=("LICENSE-$pkgver::$url/raw/v$pkgver/LICENSE")
source_x86_64=("$pkgname-$pkgver-x86_64.tar.gz::$url/releases/download/v$pkgver/rigwatch-linux-x86_64.tar.gz")
source_aarch64=("$pkgname-$pkgver-aarch64.tar.gz::$url/releases/download/v$pkgver/rigwatch-linux-aarch64.tar.gz")
sha256sums=('562ddc22d91b96be9f67019b365a7f1e705a305c1749660f92b5502d75f72c2b')
sha256sums_x86_64=('3831e69cac97ac2b55d33a560993b8353f7792814ede623435c71049e8284eed')
sha256sums_aarch64=('31aa9ef7f251dfa4d5228e6d4e9d29cc79f1403e300feb8a3493ad17dd453674')

package() {
  install -Dm755 "$srcdir/rigwatch-linux-$CARCH" "$pkgdir/usr/bin/rigwatch"
  install -Dm644 "$srcdir/LICENSE-$pkgver" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
