# Maintainer: Кирилл Фунтов <funtaps at gmail dot com>

pkgname=leandoc-bin
_pkgname=leandoc
pkgver=0.3.3
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
sha256sums=('5e72fdbaa583c327d40e12f00827ea5fd4d6c27fb6d082a5670bc0dc29d8fbd8')

package() {
  # makepkg already unpacked the .deb into control.tar.gz and data.tar.gz
  bsdtar -xf data.tar.gz -C "$pkgdir"

  install -Dm644 "$pkgdir/usr/share/doc/LeanDoc/LICENSE" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
