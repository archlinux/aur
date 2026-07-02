# Maintainer: Carlos Prieto Ortiz <prietus@live.com>
pkgname=irkt-bin
pkgver=0.3.0
pkgrel=1
pkgdesc="Modern terminal IRC client: full IRCv3, SASL/CertFP, inline images (Kitty/iTerm2/Sixel)"
arch=('x86_64' 'aarch64')
url="https://github.com/prietus/irkt"
license=('MIT')
depends=('gcc-libs')
optdepends=(
  'hunspell-en_us: English autocomplete (ghost text)'
  'hunspell-es_es: Spanish autocomplete (ghost text)'
)
provides=('irkt')
conflicts=('irkt' 'irkt-git')
source_x86_64=("irkt-$pkgver-x86_64.tar.gz::$url/releases/download/v$pkgver/irkt-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("irkt-$pkgver-aarch64.tar.gz::$url/releases/download/v$pkgver/irkt-aarch64-unknown-linux-gnu.tar.gz")

sha256sums_x86_64=('5da86b4ad791f5db82495f34c977b42b72fa0832e9c70466f77afffcf931fd69')
sha256sums_aarch64=('088d28adb313fbda3f36310b6de4bc3ea38f063f7924ef8c237f51112d8d7e91')

package() {
	install -Dm0755 irkt "$pkgdir/usr/bin/irkt"
	install -Dm0644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
	install -Dm0644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
