# Maintainer: Rafael Fontenelle <rafaelff@gnome.org>

pkgbase=gtksourceview-pkgbuild
pkgname=('mime-pkgbuild' 'gtksourceview2-pkgbuild' 'gtksourceview3-pkgbuild' 'gtksourceview4-pkgbuild')
pkgver=4
pkgrel=1
pkgdesc="PKGBUILD syntax highlight support in GtkSourceView"
arch=(any)
url="https://gitlab.com/rafaelff/$pkgbase"
license=('LGPL2.1')
source=("$url/-/archive/v$pkgver/$pkgbase-v$pkgver.tar.bz2")
md5sums=('df256107db86e50149cb686b2728586f')

package_mime-pkgbuild() {
  pkgdesc="MIME types for PKGBUILD files"
  depends=(shared-mime-info)

  cd $pkgbase-v$pkgver
  install -Dm644 pkgbuild.xml "$pkgdir"/usr/share/mime/packages/pkgbuild.xml
}

package_gtksourceview2-pkgbuild() {
  pkgdesc="PKGBUILD syntax highlight support in gtksourceview2-compliant editors"
  depends=(gtksourceview2 mime-pkgbuild)

  cd $pkgbase-v$pkgver
  install -Dm644 pkgbuild.lang "$pkgdir"/usr/share/gtksourceview-2.0/language-specs/pkgbuild.lang
}

package_gtksourceview3-pkgbuild() {
  pkgdesc="PKGBUILD syntax highlight support in gtksourceview3-compliant editors"
  depends=(gtksourceview3 mime-pkgbuild)

  cd $pkgbase-v$pkgver
  install -Dm644 pkgbuild.lang "$pkgdir"/usr/share/gtksourceview-3.0/language-specs/pkgbuild.lang
}

package_gtksourceview4-pkgbuild() {
  pkgdesc="PKGBUILD syntax highlight support in gtksourceview4-compliant editors"
  depends=(gtksourceview4 mime-pkgbuild)

  cd $pkgbase-v$pkgver
  install -Dm644 pkgbuild.lang "$pkgdir"/usr/share/gtksourceview-4/language-specs/pkgbuild.lang
}
