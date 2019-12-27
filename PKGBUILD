# Maintainer: mksegv <mingkaidong at gmail dot com>
pkgname=luyten
pkgver=0.5.4
pkgrel=2
pkgdesc="An Open Source Java Decompiler Gui for Procyon"
arch=(any)
url="https://github.com/deathmarine/Luyten"
license=('Apache')
depends=('java-runtime')
source=("${pkgname}.sh"
        "${pkgname}.desktop"
        "https://github.com/deathmarine/Luyten/releases/download/v0.5.4_Rebuilt_with_Latest_depenencies/luyten-0.5.4.jar")
sha1sums=('d76ce0d7a116b2fa04ca33032b46f896091958aa'
          '9dd85a05520c47c0e093af16e3a044b21aa6421b'
          'e5293aa3f1a943783a13f537cd0f2bcc2d33868e')
noextract=("${pkgname}-${pkgver}.jar")


package() {
  cd "$srcdir"

  mkdir -p "$pkgdir/usr/bin/"
  mkdir -p "$pkgdir/opt/luyten/lib/"

  install -m755 $pkgname.sh "$pkgdir/opt/luyten/"
  install -m644 *.jar "$pkgdir/opt/luyten/"
  install -Dm644 $pkgname.desktop "$pkgdir/usr/share/applications/$pkgname.desktop"

  ln -s "/opt/luyten/${pkgname}-${pkgver}.jar" "$pkgdir/opt/luyten/${pkgname}.jar"
  ln -s "/opt/luyten/$pkgname.sh" "$pkgdir/usr/bin/luyten"
}

# vim:set ts=2 sw=2 et:
