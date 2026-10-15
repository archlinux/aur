# Maintainer: WindustH <windusth2006@gmail.com>

pkgname=all-the-platforms-bin
_pkgname=atp
pkgver=0.1.0
pkgrel=1
pkgdesc="One command for all the platforms: read, search, post, chat and download on 67 platforms, with JSON output and an MCP server"
arch=('x86_64' 'aarch64')
url="https://github.com/WindustH/atp"
license=('MIT')
depends=('glibc' 'libgcc' 'libstdc++')
optdepends=(
  'ffmpeg: merge video and audio, audio-only downloads'
  'chromium: pass human checks in a browser (or google-chrome, microsoft-edge, brave)'
)
provides=('all-the-platforms')
conflicts=('all-the-platforms' 'all-the-platforms-git' 'atp-bin')
options=('!strip')
source_x86_64=("$_pkgname-$pkgver-x86_64.tar.gz::$url/releases/download/v$pkgver/$_pkgname-$pkgver-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("$_pkgname-$pkgver-aarch64.tar.gz::$url/releases/download/v$pkgver/$_pkgname-$pkgver-aarch64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('39b613ebbd0b9caa3a942f3aaecbe2c8d654ecd528fb81e4715a7fe2407ecd26')
sha256sums_aarch64=('86b15fe90bce278efb41ba1967e4601825ea0770ad4315028ba36c9ccf02377e')

package() {
  cd "$srcdir/$_pkgname-$pkgver-$CARCH-unknown-linux-gnu"

  install -Dm755 "$_pkgname" "$pkgdir/usr/bin/$_pkgname"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 "README.zh-CN.md" "$pkgdir/usr/share/doc/$pkgname/README.zh-CN.md"
}
