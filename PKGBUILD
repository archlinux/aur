# Maintainer: Taha YVR <taha@noiserandom.com>
pkgname=omarchyiso
pkgver=1.1.0
pkgrel=1
pkgdesc="A TUI app for creating customized Omarchy Linux ISO images"
arch=('x86_64' 'aarch64')
url="https://github.com/tahayvr/omarchyiso"
license=('MIT')
depends=('git' 'pacman' 'curl' 'expac')
options=('!debug')
source_x86_64=("$pkgname-x86_64-$pkgver.tar.gz::$url/releases/download/v$pkgver/omarchyiso-x86_64-linux.tar.gz")
source_aarch64=("$pkgname-aarch64-$pkgver.tar.gz::$url/releases/download/v$pkgver/omarchyiso-aarch64-linux.tar.gz")
sha256sums_x86_64=('dda3e0a150188b84661f4d87e6456edce29dd96f97adf8a881becece81914a52')
sha256sums_aarch64=('2a66b25ec5a2f1d3cc3a4fb6b8fbfad3679810f013c4a61578308206f0e1dc69')

package() {
  # Install binary
  install -Dm755 "omarchyiso" "$pkgdir/usr/bin/omarchyiso"

  # Attempt to install license and readme if they exist in the tarball
  if [ -f LICENSE ]; then
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  fi
  if [ -f README.md ]; then
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  fi
}
