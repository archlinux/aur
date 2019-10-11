# Maintainer: Cubxity <contact@cubxity.dev>
pkgname=hyperium-installer
pkgver=0.2
pkgrel=1
pkgdesc="Official installer for Hyperium Minecraft Client"
arch=(any)
url="https://hyperium.cc"
license=('All Rights Reserved')
depends=('java-runtime')
source=("${pkgname}.sh"
        "https://cdn.discordapp.com/attachments/485175582854873132/632229842896551937/hyperium-installer-1.0-all.jar")
sha256sums=('50bc9d881659a463e7834aa588b7a1d811c6ad62274ba99dc9fa8ce9d258710a'
          '9b3ac47b2fee9b382f5dcc21ce1790dc56caa57fba38578f867fd2e3d291b700')
noextract=("hyperium-installer-1.0-all.jar")

package() {
 cd "$srcdir"

  mkdir -p "$pkgdir/usr/bin/"
  mkdir -p "$pkgdir/opt/hyperium-installer/lib/"

  install -m755 $pkgname.sh "$pkgdir/opt/hyperium-installer/"
  install -m644 *.jar "$pkgdir/opt/hyperium-installer/"

  ln -s "/opt/hyperium-installer/hyperium-installer-1.0-all.jar" "$pkgdir/opt/hyperium-installer/${pkgname}.jar"
  ln -s "/opt/hyperium-installer/$pkgname.sh" "$pkgdir/usr/bin/hyperium-installer"
}