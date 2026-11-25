# Maintainer: Itz-Agasta <https://github.com/Itz-Agasta>
pkgname=hopbox-bin
_pkgname=hopbox
pkgver=1.0.1
pkgrel=1
pkgdesc='Run heavy builds and tests on another machine over SSH, from your laptop or your coding agent'
arch=('x86_64' 'aarch64')
url='https://github.com/Itz-Agasta/hopbox'
license=('MIT OR Apache-2.0')
depends=('gcc-libs' 'git' 'glibc' 'openssh' 'rsync')
provides=("$_pkgname")
conflicts=("$_pkgname")
options=('!debug')
source_x86_64=("$_pkgname-$pkgver-x86_64.tar.xz::$url/releases/download/v$pkgver/$_pkgname-x86_64-unknown-linux-gnu.tar.xz")
source_aarch64=("$_pkgname-$pkgver-aarch64.tar.xz::$url/releases/download/v$pkgver/$_pkgname-aarch64-unknown-linux-gnu.tar.xz")
sha256sums_x86_64=('c57bf1bd0943d708f122dd3477abfa1cbb650531e2c9772a7f3efcd168c8fadb')
sha256sums_aarch64=('61724bc7c97e7f48b1010520fa5bd79e6c9132322a8f342b0ac13713b6fbd3a0')

package() {
  cd "$_pkgname-$CARCH-unknown-linux-gnu"
  install -Dm755 "$_pkgname" "$pkgdir/usr/bin/$_pkgname"
  install -Dm644 LICENSE-MIT "$pkgdir/usr/share/licenses/$pkgname/LICENSE-MIT"
  install -Dm644 LICENSE-APACHE "$pkgdir/usr/share/licenses/$pkgname/LICENSE-APACHE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 CHANGELOG.md "$pkgdir/usr/share/doc/$pkgname/CHANGELOG.md"
}
