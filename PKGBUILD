# Maintainer: graysky <therealgraysky AT protonmail DOT com>

pkgname=iphonebackuptools
# work around until upstream versions
# https://github.com/richinfante/iphonebackuptools/issues/68
pkgver=4.0.1
pkgrel=1
pkgdesc="Extract messages, notes, photo locations and more from unencrypted iOS backups"
arch=('any')
url="https://github.com/richinfante/iphonebackuptools"
license=(MIT)
depends=(nodejs sqlite)
makedepends=(npm python)
source=(https://github.com/richinfante/iphonebackuptools/archive/"$pkgver.tar.gz")
noextract=("$_commit.tar.gz")
sha256sums=('aa91414917ace81f07d0d46a6dc04426aac6da83c0125e37a5f36f0874e0f16f')

package() {
  npm install -g --user root --prefix "$pkgdir"/usr "$srcdir/$pkgver.tar.gz"
  
  # Fix permissions
  find "$pkgdir/usr" -type d -exec chmod 755 '{}' +
  chown -R root:root "$pkgdir"
}
