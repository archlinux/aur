# Maintainer: Vaishnav Sabari Girish <vaishnav.sabari.girish@gmail.com>

pkgname=gtw-bin
_pkgname=gtw
pkgver=0.2.4
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
sha256sums_x86_64=('83ae028704870aafb972e5e62a149869262cb9e3cff0d246bc38e67f354da317')
sha256sums_aarch64=('f57447a92cb3d71b0e020ba7963954ca2b455b229a63f5fbf6852850582f6c46')

package() {
  cd "$srcdir/gtw-arch-$CARCH"
  install -Dm755 bin/gtw "$pkgdir/usr/bin/gtw"
  install -Dm644 man/man1/gtw.1 "$pkgdir/usr/share/man/man1/gtw.1"
  install -Dm644 completions/gtw.bash "$pkgdir/usr/share/bash-completion/completions/gtw"
  install -Dm644 completions/_gtw "$pkgdir/usr/share/zsh/site-functions/_gtw"
  install -Dm644 completions/gtw.fish "$pkgdir/usr/share/fish/vendor_completions.d/gtw.fish"
}
