# Maintainer: Daniel Leining <daniel@the-beach.co>

pkgname=chunky
pkgver=1.3.8
basever=1.3
pkgrel=1
pkgdesc="Minecraft mapping and rendering tool"
url="http://chunky.llbit.se/"
arch=('any')
license=('GPL3')
depends=('java-environment')
makedepends=('gendesk' 'unzip')
source=(https://launchpad.net/"$pkgname"/"$basever"/"$pkgver"/+download/Chunky-"$pkgver".zip
       chunky.sh
       chunky.png)
sha256sums=('50965052b74a3278a92d60c079018530ccc19ddd95c7b77ec8a18942ce105b63'
            '73389b938eaaf1eeac656a762fe16fab68e89ab499d11ac8427e2177a5059c57'
            '2666ecb59ad65df3d97076bf9e77fa7790f14b5d1f2d9ea53387d601264b0768')

build() {
  gendesk -f -n --pkgname "$pkgname" --pkgdesc "$pkgdesc"
}

package() {
  install -Dm755 chunky.sh "$pkgdir/usr/bin/chunky"
  install -Dm644 chunky-$pkgver.jar "$pkgdir/usr/share/java/chunky-$pkgver.jar"
  install -Dm644 chunky.desktop "$pkgdir/usr/share/applications/chunky.desktop"
  install -Dm644 chunky.png "$pkgdir/usr/share/pixmaps/chunky.png"
  ln -s chunky-$pkgver.jar "$pkgdir/usr/share/java/chunky.jar"
}
