# Maintainer: initrdmk <initrdmk at gmail dot com>
pkgname=luyten
pkgver=0.4.4
pkgrel=1
pkgdesc="An Open Source Java Decompiler Gui for Procyon"
arch=(any)
url="https://github.com/deathmarine/Luyten"
license=('Apache')
depends=('java-runtime')
source=("${pkgname}.sh"
        "https://github.com/deathmarine/Luyten/releases/download/v${pkgver}/${pkgname}-${pkgver}.jar")
sha1sums=("d76ce0d7a116b2fa04ca33032b46f896091958aa"
          "d4b8e603f7cde409368c10912c7258da9d8618d0")
noextract=("*")

package() {
  cd "$srcdir"

  mkdir -p "$pkgdir/usr/bin/"
  mkdir -p "$pkgdir/opt/luyten/lib/"

  install -m755 $pkgname.sh "$pkgdir/opt/luyten/"
  install -m644 *.jar "$pkgdir/opt/luyten/"

  ln -s "/opt/luyten/${pkgname}-${pkgver}.jar" "$pkgdir/opt/luyten/${pkgname}.jar"
  ln -s "/opt/luyten/$pkgname.sh" "$pkgdir/usr/bin/luyten"
}

# vim:set ts=2 sw=2 et:
