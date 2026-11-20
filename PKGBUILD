# Maintainer: Vaishnav Sabari Girish <vaishnav.sabari.girish@gmail.com>

pkgname=gtw-bin
_pkgname=gtw
# Latest tag with published release assets (v0.2.0 / v0.2.1 have none yet).
pkgver=0.1.0
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
sha256sums_x86_64=('eae567c3424cf591c9b4ba805f295d8fb1cbeaa997cf182d772febc30cedf6c8')
sha256sums_aarch64=('6f6ba72cbdcdd45ad0a51fdf19bfae5defbaf2126ce6c64903e89bf7c260e4c3')

package() {
  cd "$srcdir/gtw-arch-$CARCH"
  install -Dm755 bin/gtw "$pkgdir/usr/bin/gtw"
  install -Dm644 man/man1/gtw.1 "$pkgdir/usr/share/man/man1/gtw.1"
  install -Dm644 completions/gtw.bash "$pkgdir/usr/share/bash-completion/completions/gtw"
  install -Dm644 completions/_gtw "$pkgdir/usr/share/zsh/site-functions/_gtw"
  install -Dm644 completions/gtw.fish "$pkgdir/usr/share/fish/vendor_completions.d/gtw.fish"
}
