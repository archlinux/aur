# Maintainer: Taha YVR <taha@noiserandom.com>
pkgname=omarchyiso
pkgver=1.0.2
pkgrel=1
pkgdesc="A TUI app for creating customized Omarchy Linux ISO images"
arch=('x86_64' 'aarch64')
url="https://github.com/tahayvr/omarchyiso"
license=('MIT')
depends=('git' 'pacman' 'curl' 'expac')
options=('!debug')
source_x86_64=("$pkgname-x86_64-$pkgver.tar.gz::$url/releases/download/v$pkgver/omarchyiso-x86_64-linux.tar.gz")
source_aarch64=("$pkgname-aarch64-$pkgver.tar.gz::$url/releases/download/v$pkgver/omarchyiso-aarch64-linux.tar.gz")
sha256sums_x86_64=('31d6d72e783cc1adf3d9c7a94dd806a1ff9c2c4719181a7ce2f47dd8c0528420')
sha256sums_aarch64=('dc4cfc20d84cb410eefd3e3d261b7b9690115ecbbf557b34709d549b427d399d')

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
