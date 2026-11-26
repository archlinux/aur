# Maintainer: Кирилл Фунтов <funtaps at gmail dot com>

pkgname=leandoc-bin
_pkgname=leandoc
pkgver=0.4.0
pkgrel=1
pkgdesc="A focused, read-only offline viewer for Word documents"
arch=('x86_64')
url="https://abooodbah.github.io/leandoc/"
license=('MIT')
depends=(
  'glib2'
  'glibc'
  'gtk4'
  'libgcc'
  'libsoup3'
  'libstdc++'
  'webkitgtk-6.0'
  'hicolor-icon-theme'
)
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("https://github.com/abooodbah/leandoc/releases/download/v${pkgver}/LeanDoc-v${pkgver}-linux-x86_64.deb")
sha256sums=('216e230bdcd88f7207f87d02517bc7f34d732fb46d98909ad22ee7e18139fae6')

package() {
  # makepkg already unpacked the .deb into control.tar.gz and data.tar.gz
  bsdtar -xf data.tar.gz -C "$pkgdir"

  install -Dm644 "$pkgdir/usr/share/doc/LeanDoc/LICENSE" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
