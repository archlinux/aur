pkgname=kiwix-cli-bin
pkgver=0.2.0
pkgrel=1
pkgdesc='Browse a self-hosted Kiwix server from the command line'
arch=('x86_64')
url='https://github.com/joey5403/kiwix-cli'
license=('MIT')
depends=('gcc-libs')
provides=('kiwix-cli')
conflicts=('kiwix-cli')
source=("$url/releases/download/v$pkgver/kiwix-cli-$pkgver-linux-$CARCH.tar.gz")
sha256sums=('7bf98fd352891d7dfbe526ed298f3d6e79ec1392e848e59544472b45bd03ebc5')

_archive_dir="kiwix-cli-$pkgver-linux-$CARCH"

package() {
  install -Dm755 "$_archive_dir/kiwix-cli" "$pkgdir/usr/bin/kiwix-cli"
  install -Dm644 "$_archive_dir/LICENSE" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "$_archive_dir/man/man1/kiwix-cli.1" \
    "$pkgdir/usr/share/man/man1/kiwix-cli.1"
  install -Dm644 "$_archive_dir/README.md" \
    "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 "$_archive_dir/README.zh-CN.md" \
    "$pkgdir/usr/share/doc/$pkgname/README.zh-CN.md"
}
