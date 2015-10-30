# Maintainer: Daniel Leining <daniel@the-beach.co>
# Old Maintainer: Lakota Morris <lakota[at]lakotamorris[dot]com>
pkgname=chunky
pkgver=1.3.7
basever=1.3
pkgrel=1
pkgdesc="Minecraft mapping and rendering tool"
url="http://chunky.llbit.se/"
arch=('any')
license=('GPL3')
depends=('java-environment')
makedepends=('gendesk' 'unzip')
source=(https://launchpad.net/"$pkgname"/"$basever"/"$pkgver"/+download/Chunky-"$pkgver".zip
       chunky.sh)
sha256sums=('a6c37a8927c3f224186c2143b864e1757841db52fb9a4159f9982b0681d75662'
            '73389b938eaaf1eeac656a762fe16fab68e89ab499d11ac8427e2177a5059c57')

build() {
  gendesk -f -n --pkgname "$pkgname" --pkgdesc "$pkgdesc"
  unzip -o -q chunky.jar chunky-cfg.png
}

package() {
  install -Dm755 chunky.sh "$pkgdir/usr/bin/chunky"
  install -Dm644 chunky.jar "$pkgdir/usr/share/java/chunky.jar"
  install -Dm644 chunky.desktop "$pkgdir/usr/share/applications/chunky.desktop"
  install -Dm644 chunky-cfg.png "$pkgdir/usr/share/pixmaps/chunky.png"
}
