# Maintainer: Taha YVR <taha@noiserandom.com>
pkgname=omarchyiso
pkgver=1.0.1
pkgrel=1
pkgdesc="A TUI app for creating customized Omarchy Linux ISO images"
arch=('x86_64' 'aarch64')
url="https://github.com/tahayvr/omarchyiso"
license=('MIT')
depends=('git' 'pacman' 'curl' 'expac')
source_x86_64=("$pkgname-x86_64-$pkgver.tar.gz::$url/releases/download/v$pkgver/omarchyiso-x86_64-linux.tar.gz")
source_aarch64=("$pkgname-aarch64-$pkgver.tar.gz::$url/releases/download/v$pkgver/omarchyiso-aarch64-linux.tar.gz")
sha256sums_x86_64=('385746aff912fae11220f9b761896a87a408d49fbcf1a22b39bc33f7d9f922ad')
sha256sums_aarch64=('fc8f63b00b91f8909e553cc4f1bde083fca51697137acd5b6015827415ce80c8')

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
