# Maintainer: Rafael Fontenelle <rafaelff@gnome.org>

pkgbase=gtksourceview-pkgbuild
pkgname=('mime-pkgbuild' 'gtksourceview2-pkgbuild' 'gtksourceview3-pkgbuild')
pkgver=3
pkgrel=3
pkgdesc="PKGBUILD syntax highlight support in GtkSourceView"
arch=(any)
url="https://gitlab.com/rafaelff/$pkgbase"
license=('LGPL2.1')
source=("$url/-/archive/v3/$pkgbase-v$pkgver.tar.bz2")
md5sums=('d229557b5853e6a343fca524d5b00cdc')

package_mime-pkgbuild() {
  pkgdesc="MIME types for PKGBUILD files"
  depends=('shared-mime-info')

  cd $pkgbase-v$pkgver
  install -Dm644 pkgbuild.xml "$pkgdir"/usr/share/mime/packages/pkgbuild.xml
}

package_gtksourceview2-pkgbuild() {
  pkgdesc="PKGBUILD syntax highlight support in gtksourceview2 for Mousepad and others"
  depends=('gtksourceview2' 'mime-pkgbuild')

  cd $pkgbase-v$pkgver
  install -Dm644 pkgbuild.lang "$pkgdir"/usr/share/gtksourceview-2.0/language-specs/pkgbuild.lang
}

package_gtksourceview3-pkgbuild() {
  pkgdesc="PKGBUILD syntax highlight support in gtksourceview3 for Gedit 3 and others"
  depends=('gtksourceview3' 'mime-pkgbuild')

  cd $pkgbase-v$pkgver
  install -Dm644 pkgbuild.lang "$pkgdir"/usr/share/gtksourceview-3.0/language-specs/pkgbuild.lang
}
