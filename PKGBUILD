# Maintainer: mkdong <mingkaidong at gmail dot com>
pkgname=luyten-bin
_pkgname=luyten
pkgver=0.5.3
pkgrel=1
pkgdesc="An Open Source Java Decompiler Gui for Procyon"
arch=(any)
url="https://github.com/deathmarine/Luyten"
license=('Apache')
depends=('java-runtime')
source=("${_pkgname}.sh"
        "${_pkgname}.desktop"
        "https://github.com/deathmarine/Luyten/releases/download/v${pkgver}/${_pkgname}-${pkgver}.jar")
sha1sums=("d76ce0d7a116b2fa04ca33032b46f896091958aa"
          "d092f2a3adb62ffa5685bb4a32cffa49414b5182"
          "db16e22b0b4e9efb1d88c298863b55a85965bbd3")
noextract=("${_pkgname}-${pkgver}.jar")


package() {
  cd "$srcdir"

  mkdir -p "$pkgdir/usr/bin/"
  mkdir -p "$pkgdir/opt/luyten/lib/"

  install -m755 $_pkgname.sh "$pkgdir/opt/luyten/"
  install -m644 *.jar "$pkgdir/opt/luyten/"
  install -Dm644 $_pkgname.desktop "$pkgdir/usr/share/applications/$_pkgname.desktop"

  ln -s "/opt/luyten/${_pkgname}-${pkgver}.jar" "$pkgdir/opt/luyten/${_pkgname}.jar"
  ln -s "/opt/luyten/$_pkgname.sh" "$pkgdir/usr/bin/luyten"
}

# vim:set ts=2 sw=2 et:
