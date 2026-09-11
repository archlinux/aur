# Maintainer: Shahriyar Alam <mdshahriyaralam552@gmail.com>
# Prebuilt binary - no Rust toolchain needed to install.
pkgname=maono-bin
_pkgname=maono
pkgver=0.2.0
pkgrel=1
pkgdesc='Control a Maono PD100W wireless microphone from a terminal UI or the command line (prebuilt)'
arch=('x86_64')
url='https://github.com/shahriyardx/maono'
license=('MIT')
depends=('gcc-libs')
provides=("$_pkgname")
conflicts=("$_pkgname" "$_pkgname-git")
options=('!strip' '!debug')
source=("$_pkgname-$pkgver-x86_64.tar.gz::$url/releases/download/v$pkgver/$_pkgname-$pkgver-x86_64.tar.gz")
sha256sums=('8e143c536cdcd4af6154d9c269a7da0adbca773043c054009ce38ee86b1dc63f')

package() {
  cd "$_pkgname-$pkgver-x86_64"
  install -Dm755 maono "$pkgdir/usr/bin/maono"
  install -Dm644 99-maono.rules "$pkgdir/usr/lib/udev/rules.d/99-maono.rules"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$_pkgname/README.md"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
