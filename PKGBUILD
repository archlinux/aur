pkgname=weki-input-helper
pkgver=1.0.1
pkgrel=1
pkgdesc='Helps with signal transformation for Wekinator inputs.'
arch=('any')
url='http://www.wekinator.org/'
depends=('java-runtime')
source=(https://github.com/fiebrink1/WekiInputHelper/releases/download/v$pkgver/WekiInputHelper-${pkgver}_AnyOS.zip
        icon.icns::https://github.com/fiebrink1/WekiInputHelper/raw/master/src/wekiinputhelper/icons/wekihelper.icns
        "$pkgname.run"
        "$pkgname.desktop")
md5sums=('94593da7306747e41cc8377929dc5779'
         'bb9bbc91296553017fd5a4986d71e781'
         'df68c63b33a7c7ec6bad2d23fa137b5e'
         '61c278576e1878d6454dc6ed8d697ec4')

package() {
  install -m 644 -D "$srcdir/WekiInputHelper.jar" "$pkgdir/usr/share/java/$pkgname/WekiInputHelper.jar"
  for filepath in $srcdir/lib/*.jar ;do
    install -m 644 -D "$filepath" "$pkgdir/usr/share/java/$pkgname/lib/$(basename $filepath)"
  done

  install -m 755 -D "$pkgname.run" "$pkgdir/usr/bin/$pkgname"
  install -m 644 -D "$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
  install -m 644 -D "icon.icns" "$pkgdir/usr/share/$pkgname/icon.icns"
}
