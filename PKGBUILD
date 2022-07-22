pkgname=mfosu-bin
pkgver=2022.528.0
pkgrel=1
pkgdesc="An fork of osu!lazer."
arch=(x86_64)
url="https://github.com/MATRIX-feather/osu"
license=(
  "MIT"
  "custom:CC-BY-NC 4.0"
)
depends=(
  zlib
  libgl
  fuse2
  osu-mime
)
provides=(
  osu-lazer
  mf-osu
  mfosu
)
options=(!strip)
source=(
  "https://dl.hiosu.com/本地下载点① - 电信网络推荐/Linux版($pkgver)/mfosu.appimage"
  "https://github.com/MATRIX-feather/osu/raw/stable/assets/lazer.png"
  "https://raw.githubusercontent.com/ppy/osu-resources/master/LICENCE.md"
  "mfosu.desktop"
  "mfosu"
)
noextract=("mfosu.appimage")
sha256sums=(
  "SKIP"
  "SKIP"
  "SKIP"
  "SKIP"
  "SKIP"
)
package() {
  cd "$srcdir"
  # Install binary and launch script
  install -Dm755 "mfosu.appimage" "$pkgdir/opt/mfosu/mfosu.appimage"
  install -Dm755 -t "$pkgdir/usr/bin" mfosu
  # Install pixmap, desktop and license file
  install -Dm644 lazer.png "$pkgdir/usr/share/pixmaps/mfosu.png"
  install -Dm644 -t "$pkgdir/usr/share/applications" mfosu.desktop
  install -Dm644 -t "$pkgdir/usr/share/licenses/mfosu" LICENCE.md
}
