# Maintainer: Daniel Leining <daniel@the-beach.co>
# Old Maintainer: Lakota Morris <lakota[at]lakotamorris[dot]com>
pkgname=chunky
pkgver=1.3.1
pkgrel=1
pkgdesc="Chunky is a Minecraft mapping and rendering tool created by Jesper Öqvist."
url="http://chunky.llbit.se/"
arch=('any')
license=('GPL3')
depends=('java-runtime')
makedepends=('apache-ant' 'gendesk' 'unzip')
source=(http://chunkyupdate.llbit.se/ChunkyLauncher.jar
       chunky.sh)
noextract=(ChunkyLauncher.jar)
md5sums=('f1596acc7fa964eedbf3c7d2f51ec469'
         '44aeea210e55fe35581069a1ac05e57a')

build() {
  gendesk -f -n --pkgname "$pkgname" --pkgdesc "$pkgdesc"
  unzip -o -q ChunkyLauncher.jar chunky-cfg.png
}

package() {
  install -Dm755 chunky.sh "$pkgdir/usr/bin/chunky"
  install -Dm644 ChunkyLauncher.jar "$pkgdir/usr/share/java/ChunkyLauncher.jar"
  install -Dm644 chunky.desktop "$pkgdir/usr/share/applications/chunky.desktop"
  install -Dm644 chunky-cfg.png "$pkgdir/usr/share/pixmaps/chunky.png"
}
