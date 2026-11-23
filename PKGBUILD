# Maintainer: Vaishnav Sabari Girish <vaishnav.sabari.girish@gmail.com>

pkgname=gtw-bin
_pkgname=gtw
pkgver=0.2.3
pkgrel=1
pkgdesc='Wikipedia in your terminal: cached reading, rich rendering, inline media, and offline lists (prebuilt binary)'
arch=('x86_64' 'aarch64')
url='https://github.com/craftty-org/gtw'
license=('GPL-3.0-only')
depends=('alsa-lib' 'gcc-libs' 'glibc')
provides=("$_pkgname")
conflicts=("$_pkgname")
options=('!strip')
source_x86_64=("$_pkgname-$pkgver-x86_64.tar.gz::$url/releases/download/v$pkgver/gtw-arch-x86_64.tar.gz")
source_aarch64=("$_pkgname-$pkgver-aarch64.tar.gz::$url/releases/download/v$pkgver/gtw-arch-aarch64.tar.gz")
sha256sums_x86_64=('c206189cd833aff3fa2967f96cc1e9cc8e4df71e34a99a47d304cc03a5920ae4')
sha256sums_aarch64=('98e197655ca7284f5bd104e11d72321641281aff822d24bc07a27b0f4f972d01')

package() {
  cd "$srcdir/gtw-arch-$CARCH"
  install -Dm755 bin/gtw "$pkgdir/usr/bin/gtw"
  install -Dm644 man/man1/gtw.1 "$pkgdir/usr/share/man/man1/gtw.1"
  install -Dm644 completions/gtw.bash "$pkgdir/usr/share/bash-completion/completions/gtw"
  install -Dm644 completions/_gtw "$pkgdir/usr/share/zsh/site-functions/_gtw"
  install -Dm644 completions/gtw.fish "$pkgdir/usr/share/fish/vendor_completions.d/gtw.fish"
}
