# Maintainer: Rafael Fontenelle <rafaelff@gnome.org>

pkgbase=gtksourceview-pkgbuild
pkgname=(mime-pkgbuild gtksourceview3-pkgbuild gtksourceview4-pkgbuild gtksourceview5-pkgbuild)
pkgver=5
pkgrel=2
pkgdesc="PKGBUILD syntax highlight support in GtkSourceView"
arch=(any)
url="https://gitlab.com/rafaelff/$pkgbase"
license=(LGPL-2.1-or-later)
source=("$url/-/archive/v$pkgver/$pkgbase-v$pkgver.tar.bz2")
sha256sums=('75320b33a21baf929a785690d1570e1b853383c31b6473df572ddb4b921c9f73')

package_mime-pkgbuild() {
  pkgdesc="MIME types for PKGBUILD files"
  depends=(shared-mime-info)

  cd $pkgbase-v$pkgver
  install -Dm644 pkgbuild.xml -t "$pkgdir"/usr/share/mime/packages
}

package_gtksourceview3-pkgbuild() {
  pkgdesc="PKGBUILD syntax highlight support in gtksourceview3-compliant editors"
  depends=(gtksourceview3 mime-pkgbuild)

  cd $pkgbase-v$pkgver
  install -Dm644 pkgbuild.lang -t "$pkgdir"/usr/share/gtksourceview-3.0/language-specs
  install -Dm644 pkgbuild.lang -t "$pkgdir"/usr/share/libgedit-gtksourceview-300/language-specs/pkgbuild.lang
}

package_gtksourceview4-pkgbuild() {
  pkgdesc="PKGBUILD syntax highlight support in gtksourceview4-compliant editors"
  depends=(gtksourceview4 mime-pkgbuild)

  cd $pkgbase-v$pkgver
  install -Dm644 pkgbuild.lang -t "$pkgdir"/usr/share/gtksourceview-4/language-specs
}

package_gtksourceview5-pkgbuild() {
  pkgdesc="PKGBUILD syntax highlight support in gtksourceview5-compliant editors"
  depends=(gtksourceview5 mime-pkgbuild)

  cd $pkgbase-v$pkgver
  install -Dm644 pkgbuild.lang -t "$pkgdir"/usr/share/gtksourceview-5/language-specs
}
