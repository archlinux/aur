pkgname=wekimini
pkgver=2.1.0.4
pkgrel=1
pkgdesc='The Wekinator: On-the-fly Learning for Controller Mapping.'
arch=('any')
url='http://www.wekinator.org/'
license=('GPL2')
depends=('java-runtime')
source=(https://github.com/fiebrink1/wekimini/releases/download/v$pkgver/Any_OS_v$pkgver.zip
        icon.icns::https://github.com/fiebrink1/wekimini/raw/master/src/wekimini/wekimini1.icns
        "$pkgname.run"
        "wekimini.desktop")
md5sums=('d573a9dd8d7f8a5712e2fc67059e1ffd'
         '948950a7750e35d7111b8b9158a5e9a5'
         '7d8c3edf5a8cc04a0c61c7de29a71497'
         '0ca65c14593eb65ff90690127ac6e7de')

package() {
  install -m 644 -D "$srcdir/WekiMini.jar" "$pkgdir/usr/share/java/$pkgname/WekiMini.jar"
  for filepath in $srcdir/lib/*.jar ;do
    install -m 644 -D "$filepath" "$pkgdir/usr/share/java/$pkgname/lib/$(basename $filepath)"
  done

  install -m 755 -D "$pkgname.run" "$pkgdir/usr/bin/$pkgname"
  install -m 644 -D "wekimini.desktop" "$pkgdir/usr/share/applications/wekimini.desktop"
  install -m 644 -D "icon.icns" "$pkgdir/usr/share/$pkgname/icon.icns"
}
