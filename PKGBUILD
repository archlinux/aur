# Maintainer: Adria Arrufat <swiftscythe@gmail.com>
pkgname=reload-editor
pkgver=2.5.5
pkgrel=1
pkgdesc="Content Package and Metadata editor"
arch=('i686' 'x86_64')
url="http://www.reload.ac.uk/editor.html"
license=('GPL')
depends=('java-runtime')
source=('http://www.reload.ac.uk/download/Reload_Dist255_Java15.zip' 'reload-editor.desktop' 'reload-editor.sh')
md5sums=('d7e51041f5ff606819901915c4083612'
         '279e19dc7e7ac2b425f8f8379a41f15f'
         '591600911c1718d1d9d22b27b7374b51')

build() {
  cd "$srcdir"

  mkdir -p "$pkgdir"/usr/share/java/$pkgname
  install -m644 $pkgname.jar "$pkgdir"/usr/share/java/$pkgname
  cp -r lib/  "$pkgdir"/usr/share/java/$pkgname
  cp -r schema/  "$pkgdir"/usr/share/java/$pkgname

  install -D -m755 "$srcdir"/$pkgname.sh "$pkgdir"/usr/bin/$pkgname
  install -D -m644 "$srcdir"/$pkgname.desktop "$pkgdir"/usr/share/applications/$pkgname.desktop
  install -D -m644 "$srcdir"/app32.gif "$pkgdir"/usr/share/pixmaps/$pkgname.gif
}

# vim:set ts=2 sw=2 et:
