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
sha256sums=('50bc9d881659a463e7834aa588b7a1d811c6ad62274ba99dc9fa8ce9d258710a'
          '7b462c17f6ab1b0bb7abb4f093d5d625e5c30055f05387d7a1ae91ae70d24cae')
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