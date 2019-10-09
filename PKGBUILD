# Maintainer: Cubxity <contact@cubxity.dev>
pkgname=hyperium-installer
pkgver=0.1
pkgrel=1
pkgdesc="Official installer for Hyperium Minecraft Client"
arch=(any)
url="https://hyperium.cc"
license=('All Rights Reserved')
depends=('java-runtime')
source=("${pkgname}.sh"
        "https://cdn.discordapp.com/attachments/595634170336641045/631183200345129001/Hyperium_1.1.jar")
sha1sums=('eb818afbdc093ca17a26c678a127a24ac70ae37c'
          'a9c727341f0049ba19553a0d1d8bb3a37656091f')
noextract=("Hyperium_1.1.jar")

package() {
 cd "$srcdir"

  mkdir -p "$pkgdir/usr/bin/"
  mkdir -p "$pkgdir/opt/hyperium-installer/lib/"

  install -m755 $pkgname.sh "$pkgdir/opt/hyperium-installer/"
  install -m644 *.jar "$pkgdir/opt/hyperium-installer/"

  ln -s "/opt/hyperium-installer/Hyperium_1.1.jar" "$pkgdir/opt/hyperium-installer/${pkgname}.jar"
  ln -s "/opt/hyperium-installer/$pkgname.sh" "$pkgdir/usr/bin/hyperium-installer"
}