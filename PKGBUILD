# Maintainer: bromigOS <packages@bromigos.org>
# Contributor: blackflame
pkgname=bromigos-mirrorlist
pkgver=1
pkgrel=1
pkgdesc='bromigOS package repository mirrors'
arch=('any')
backup=('etc/pacman.d/bromigos-mirrorlist')
options=('!debug')
url='https://github.com/bromigos-org/bromigOS'
license=('MIT OR Apache-2.0')
_tag=aur-bootstrap-6f8c6e3cc345
source=("bromigos-$_tag.tar.gz::$url/archive/refs/tags/$_tag.tar.gz")
source+=('bromigos-mirrorlist')
sha256sums=('ea499760a23c382614c268f6059c78199ba3406a478fe86370cfa778722da0db' '08766898c9e796a7a0ddda69883b50dd592c078c69f864797b3bbc23d28eacc9')
_source_root() { printf '%s' "$srcdir/bromigOS-${_tag#v}"; }

package() {
  _root=$(_source_root)
  install -Dm644 "$srcdir/bromigos-mirrorlist" "$pkgdir/etc/pacman.d/bromigos-mirrorlist"
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" "$_root/LICENSE-MIT" "$_root/LICENSE-APACHE"
}
