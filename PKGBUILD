# Maintainer: Hoàng Văn Khải <hvksmr1996@gmail.com>

pkgname=joplin-appimg
pkgver=1.0.195
pkgrel=0
pkgdesc="A note taking and to-do application with synchronization capabilities"
provides=('joplin')
conflicts=('joplin')
arch=('x86_64')
url="https://github.com/laurent22/joplin"
license=(MIT)
depends=(fuse)
options=(!strip)
source=(
  ${url}/releases/download/v${pkgver}/Joplin-${pkgver}.AppImage
  ${url}/raw/v${pkgver}/LICENSE
  joplin.desktop
  joplin.svg::${url}/raw/v${pkgver}/Assets/JoplinIcon.svg
)
sha512sums=(
  SKIP
  SKIP
  SKIP
  SKIP
)

package() {
  echo
  echo "     _             _ _       "
  echo "    | | ___  _ __ | (_)_ __  "
  echo " _  | |/ _ \| '_ \| | | '_ \ "
  echo "| |_| | (_) | |_) | | | | | |"
  echo " \___/ \___/| .__/|_|_|_| |_|"
  echo "            |_|              "
  echo

  install -Dm755 Joplin-${pkgver}.AppImage "$pkgdir"/usr/bin/JoplinDesktop.AppImage
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
  install -Dm755 joplin.desktop "$pkgdir"/usr/share/applications/joplin.desktop
  install -Dm644 joplin.svg "$pkgdir"/usr/share/icons/joplin.svg
}
