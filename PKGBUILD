# Maintainer: initrdmk <initrdmk at gmail dot com>
pkgname=luyten
pkgver=0.5.3
pkgrel=1
pkgdesc="An Open Source Java Decompiler Gui for Procyon"
arch=(any)
url="https://github.com/deathmarine/Luyten"
license=('Apache')
depends=('java-runtime')
source=("${pkgname}.sh"
        "${pkgname}.desktop"
        "https://github.com/deathmarine/Luyten/releases/download/v${pkgver}/${pkgname}-${pkgver}.jar")
sha1sums=("d76ce0d7a116b2fa04ca33032b46f896091958aa"
          "d092f2a3adb62ffa5685bb4a32cffa49414b5182"
          "db16e22b0b4e9efb1d88c298863b55a85965bbd3")
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
