# Maintainer: Allie Bayless <drbayless@gmail.com>
#
# Generated from packaging/aur/PKGBUILD.in by packaging/aur/render-pkgbuild.sh.
# Edit the template in the rigwatch repository, not this file.

pkgname=rigwatch-bin
pkgver=0.0.21
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
sha256sums_x86_64=('d081ad9150e199f9ab3387aff0dec58ade52945a1414634ff0acb6261e4d0b5f')
sha256sums_aarch64=('7ce7152304819ae9c56d73b151312f66a57e03090e72c4a6c49d9b3f3fb2450b')

package() {
  install -Dm755 "$srcdir/rigwatch-linux-$CARCH" "$pkgdir/usr/bin/rigwatch"
  install -Dm644 "$srcdir/LICENSE-$pkgver" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
