# Maintainer: graysky <graysky AT archlinux DOT us>

pkgname=iphonebackuptools
_commit=c5573a3e5446ea420a56d2477ef78550cee224fb
_short=78
# work around until upstream versions
# https://github.com/richinfante/iphonebackuptools/issues/68
pkgver=1.$_short
pkgrel=2
pkgdesc="Extract messages, notes, photo locations and more from unencrypted iOS backups"
arch=('any')
url="https://github.com/richinfante/iphonebackuptools"
license=('MIT')
depends=('nodejs' 'sqlite')
makedepends=('npm' 'python')
source=(
https://github.com/richinfante/iphonebackuptools/archive/$_commit.tar.gz
)
sha256sums=('6cc52d2fe0b09a5b5fa8f9f80f4de77d9cc7dbf130057432a7267c9093372828')

package() {
  npm install -g --user root --prefix "$pkgdir"/usr "$srcdir/$_commit.tar.gz"
  
  # Fix permissions
  find "$pkgdir/usr" -type d -exec chmod 755 '{}' +
  chown -R root:root "${pkgdir}"
}
