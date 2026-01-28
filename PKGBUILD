# Maintainer: Taha YVR <taha@noiserandom.com>
pkgname=omarchyiso
pkgver=1.0.0
pkgrel=1
pkgdesc="A TUI app for creating customized Omarchy Linux ISO images"
arch=('x86_64' 'aarch64')
url="https://github.com/tahayvr/omarchyiso"
license=('MIT')
depends=('git' 'pacman' 'curl' 'expac')
source_x86_64=("$pkgname-x86_64-$pkgver.tar.gz::$url/releases/download/v$pkgver/omarchyiso-x86_64-linux.tar.gz")
source_aarch64=("$pkgname-aarch64-$pkgver.tar.gz::$url/releases/download/v$pkgver/omarchyiso-aarch64-linux.tar.gz")
sha256sums_x86_64=('ef88c387b7210504c1a322e2dbc140215d0601a37ac6ab926845a70e904cd63f')
sha256sums_aarch64=('1476c097cdfd0dec771e266e535689c6f4919724be9edd640275189c286e6b66')

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
