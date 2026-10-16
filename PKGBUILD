# Maintainer: Matt Moyles <matt@mattmoyles.com>
pkgname=ans2irc-bin
_name=ans2irc
pkgver=0.1.0
pkgrel=1
pkgdesc='Convert ANSI art to mIRC-coloured text that fits in IRC messages (static binary)'
arch=('x86_64' 'aarch64')
url='https://github.com/mmoyles87/ans2irc'
license=('GPL-3.0-or-later')
provides=("$_name")
conflicts=("$_name")
source_x86_64=("$url/releases/download/v$pkgver/$_name-$pkgver-x86_64-unknown-linux-musl.tar.gz")
source_aarch64=("$url/releases/download/v$pkgver/$_name-$pkgver-aarch64-unknown-linux-musl.tar.gz")
sha256sums_x86_64=('51323c723df8e35249b6ca229565d674988b602ef474085028b2bcdad455b6fc')
sha256sums_aarch64=('d1e11f8349d0f4e9db5a05a56a254f932e205010769234da67c6ba6abc8cf015')

package() {
  cd "$_name-$pkgver-$CARCH-unknown-linux-musl"
  install -Dm755 ans2irc "$pkgdir/usr/bin/ans2irc"
  install -Dm644 ans2irc.1 "$pkgdir/usr/share/man/man1/ans2irc.1"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$_name/README.md"
}
