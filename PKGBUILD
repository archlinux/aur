pkgname=mfosu-bin
pkgver=2022.528.0
pkgrel=2
pkgdesc="An fork of osu!lazer."
arch=(x86_64)
url="https://github.com/MATRIX-feather/osu"
license=(
  "MIT"
  "CC-BY-NC 4.0"
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
  "fe8f26b11443a0f0e6dc9e6c10d32d9c3c5cc3f2e825e970f4ebfe4f7994ae37"
  "36f73cfe0a84cd65a8bb54fcde5a01c419b134bee4a88cc92eb4f33236343a10"
  "30b914824784b6ba6b30a44b22bea4f3c6fbc10f3f0e74fde5ca76a92ef57244"
  "a072250ea8407385937d9a25e077ba71ec581da67598922fe4893f097dfe3280"
  "2bf4c70aebc2375b8fd607981ff1999b60659d13aab80df42b735085d0fd0cec"
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
