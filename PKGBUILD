# Maintainer: MingxuanGame <MingxuanGame@outlook.com>

pkgname=ez2lazer-bin
_pkgname=${pkgname%-bin}
pkgver=2026.830.1
pkgrel=1
_pkgtag=$pkgver-ez2lazer
pkgdesc="Ez to Lazer, As a cool client. (a fork of osu!lazer)"
arch=(x86_64)
url="https://github.com/SK-la/Ez2Lazer"
license=("MIT" "custom:CC-BY-NC 4.0")
depends=(
  zlib
  libgl
  fuse2
  osu-mime
)
provides=(ez2lazer)
conflicts=(ez2lazer ez2lazer-git)
options=(!strip !debug)
source=(
  "$_pkgname-$pkgver.AppImage::https://github.com/SK-la/Ez2Lazer/releases/download/$_pkgtag/ez2lazer.AppImage"
  'icon.png'
  'https://raw.githubusercontent.com/ppy/osu-resources/master/LICENCE.md'
  'ez2lazer.desktop'
  'ez2lazer-uri-handler.desktop'
  'ez2lazer')
noextract=("$_pkgname-$pkgver.AppImage")
sha256sums=('4f1e7359374b98515ef7ed3d0b599298e7916055d03d383336ecb35d5f05f756'
            'ae382d6f50b8a767ccb30f49925020b610805f5403b7a99cd331a4f7b720e8ac'
            '30b914824784b6ba6b30a44b22bea4f3c6fbc10f3f0e74fde5ca76a92ef57244'
            'c59ce9a6c90cfafb97c6a8f5f01c7a95191565c7169603c40fa785fc01e0b557'
            'ca8f63ca0c535ee08ef1a28066f6ae689bcd84e3af6c5fb3af3b1d5e8739653e'
            '14f4725fa007badd0f079c3459ced3b8e9f6e521fdb965e84075604d72fcb4fc')
package() {
  cd "$srcdir"

  # Install binary and launch script
  install -Dm755 "$_pkgname-$pkgver.AppImage" "$pkgdir/opt/ez2lazer/ez2lazer.AppImage"
  install -Dm755 -t "$pkgdir/usr/bin" ez2lazer

  # Install pixmap, desktop and license file
  install -Dm644 icon.png "$pkgdir/usr/share/pixmaps/ez2lazer.png"
  install -Dm644 -t "$pkgdir/usr/share/applications" ez2lazer.desktop
  install -Dm644 -t "$pkgdir/usr/share/applications" ez2lazer-uri-handler.desktop
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENCE.md
}
