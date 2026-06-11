# Maintainer: MingxuanGame <MingxuanGame@outlook.com>

pkgname=osu-gu-bin
_pkgname=${pkgname%-bin}
pkgver=2026.611.0
_pkgtag=v${pkgver}-lazer
pkgrel=1
pkgdesc="A free-to-win rhythm game. GooGuTeam fork of osu!lazer."
arch=(x86_64)
url="https://github.com/GooGuTeam/osu"
license=("MIT" "custom:CC-BY-NC 4.0")
depends=(
  zlib
  libgl
  fuse2
  osu-mime
)
provides=(osu-gu)
conflicts=(osu-gu osu-gu-git)
options=(!strip !debug)
source=(
  "$_pkgname-$pkgver.AppImage::https://github.com/GooGuTeam/osu/releases/download/$_pkgtag/osu.AppImage"
  "icon.png"
  "https://raw.githubusercontent.com/ppy/osu-resources/master/LICENCE.md"
  "osu-gu.desktop"
  "osu-gu-uri-handler.desktop"
  "osu-gu"
)
noextract=("$_pkgname-$pkgver.AppImage")
sha256sums=('d026ec4afef6412813da3e7343376d00cd468270adf68580084b2460f4893b80'
            '30cf4df3fd76006b08a0bcb6a325fb2fdcf6a4371f77001da3c38cbce871bd51'
            '30b914824784b6ba6b30a44b22bea4f3c6fbc10f3f0e74fde5ca76a92ef57244'
            '719733029ec5eddd3bfd9c7fdfcdcb5b4fbbc52a021d284448443d165191e34c'
            '9568f8057ace9236017f2b1a5e2df023f429915f11b99cfb26c936dce39ec63c'
            'c93f14f0681ec324d23c663c5929d123d2d419477056a8ef6815d9a4ca8f16b5')

package() {
  cd "$srcdir"

  install -Dm755 "$_pkgname-$pkgver.AppImage" "$pkgdir/opt/osu-gu/osu.AppImage"
  install -Dm755 -t "$pkgdir/usr/bin" osu-gu

  install -Dm644 icon.png "$pkgdir/usr/share/pixmaps/osu-gu.png"
  install -Dm644 -t "$pkgdir/usr/share/applications" osu-gu.desktop
  install -Dm644 -t "$pkgdir/usr/share/applications" osu-gu-uri-handler.desktop
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENCE.md
}