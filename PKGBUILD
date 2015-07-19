# Maintainer: Christian-Maximilian Steier
pkgname=easytranscript
pkgver=2.50.1
pkgrel=1
pkgdesc="Easy to use transcription-software with a high feature volume"
arch=('i686' 'x86_64')
url="http://e-werkzeug.eu/index.php/en/products/easytranscript"
license=("GPL")
depends=('jre8-openjdk' 'java-openjfx')
optdepends=('vlc')
makedepends=('unzip')
source=("${pkgname}-${pkgver}.zip::http://www.e-werkzeug.eu/counter/count.php?id=mac" 'easytranscript.desktop' 'easytranscript')
md5sums=('bea5a44a1a0bb15fc38fb65594b264c3'
         'd8c3e78dae9269431b0411c04f6ae489'
         '54f0a79ac82d5d692413980c056b81e7')

build() {
  cd "$srcdir"
}

package() {
  cd "$srcdir"
  install -d $pkgdir/usr/share/licenses/${pkgname}/
  install -Dm 644 licenses/* $pkgdir/usr/share/licenses/${pkgname}/
  install -Dm 644 "README (Troubleshooting Linux).txt" $pkgdir/usr/share/doc/${pkgname}/README
  install -d $pkgdir/usr/share/java/${pkgname}/
  install -Dm 644 easysysteminspector.jar $pkgdir/usr/share/java/${pkgname}/easysysteminspector.jar
  install -Dm 644 ${pkgname}.jar $pkgdir/usr/share/java/${pkgname}/${pkgname}.jar
  install -Dm 644 updater.jar $pkgdir/usr/share/java/${pkgname}/updater.jar
  install -Dm 644 libJXGrabKey.so $pkgdir/usr/share/java/${pkgname}/libJXGrabKey.so
  install -d $pkgdir/usr/share/java/${pkgname}/lib/
  install -Dm 755 lib/* $pkgdir/usr/share/java/${pkgname}/lib/
  install -Dm 755 ${pkgname} $pkgdir/usr/bin/${pkgname}
  install -Dm 644 logo.ico $pkgdir/usr/share/icons/${pkgname}.ico
  install -Dm 644 ${pkgname}.desktop $pkgdir/usr/share/applications/${pkgname}.desktop
}
