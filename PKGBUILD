# Maintainer: Anthony Green <anthony.j.green@outlook.com>

pkgname=hyprlog
pkgver=0.1.1
pkgrel=1
pkgdesc="Hyprland focus/activity logger"
arch=('x86_64' 'aarch64')
url="https://github.com/gusjengis/hyprlog"
license=('MIT')

depends=('gcc-libs' 'hyprland')
makedepends=()
options=('!strip' '!debug')

# Pull the correct prebuilt tarball for each arch
source_x86_64=("$pkgname-v$pkgver-x86_64-unknown-linux-gnu.tar.gz::$url/releases/download/v$pkgver/$pkgname-v$pkgver-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("$pkgname-v$pkgver-aarch64-unknown-linux-gnu.tar.gz::$url/releases/download/v$pkgver/$pkgname-v$pkgver-aarch64-unknown-linux-gnu.tar.gz")

sha256sums_x86_64=('0aa43be856d997d68867576c23e9bdd46adf773ebe62495ace8ec6d38590555f')
sha256sums_aarch64=('99a73c67970031a2861f85a1c7ed3a0b87de0c52ce79b379a0c428ade322fc14')

package() {
  cd "$srcdir"
  install -Dm755 hyprlog  "$pkgdir/usr/bin/hyprlog"
  install -Dm755 hyprlogd "$pkgdir/usr/bin/hyprlogd"
  install -Dm644 LICENSE  "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
