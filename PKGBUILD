# Maintainer: MingxuanGame <MingxuanGame@outlook.com>

pkgname=g0v0-robin-bin
_pkgname=${pkgname%-bin}
pkgver=2026.1101.0
_pkgtag=v${pkgver}-g0v0
pkgrel=1
pkgdesc="g0v0! -- free and open rhythm experience! (Robin pre-release channel)"
arch=(x86_64 aarch64)
url="https://github.com/GooGuTeam/g0v0"
license=("MIT" "custom:CC-BY-NC 4.0")
depends=(
  zlib
  libgl
  fuse2
  osu-mime
)
provides=(g0v0)
conflicts=(g0v0 g0v0-bin g0v0-robin g0v0-git)
options=(!strip !debug)
source=(
  "icon.png"
  "https://raw.githubusercontent.com/GooGuTeam/g0v0-resources/master/LICENCE.md"
  "g0v0.desktop"
  "g0v0-uri-handler.desktop"
  "g0v0"
)
noextract=("${_pkgname}-${_pkgtag}-x86_64.AppImage" "${_pkgname}-${_pkgtag}-aarch64.AppImage")
source_x86_64=(
  "${_pkgname}-${_pkgtag}-x86_64.AppImage::https://github.com/GooGuTeam/g0v0/releases/download/${_pkgtag}/g0v0.AppImage"
)
source_aarch64=(
  "${_pkgname}-${_pkgtag}-aarch64.AppImage::https://github.com/GooGuTeam/g0v0/releases/download/${_pkgtag}/g0v0-arm64.AppImage"
)
sha256sums=('c93f6981c6c528e717d5215eeed775cf4926fe61476d95163b3ecd5770f40dda'
            '96276add86bd921e64255ce7e5487599dbe13e6e48e96a6af1a58cc99c187648'
            '26ecc3e357b03798cd8cc4ada4348d9e8eef1f3c725f8176e3b9533185c0bd0a'
            'dfbe774cb090a23f4000859dd9bb6c79717e20d091737893b915a55db5b4965a'
            '437545915242c3284ed8da47e125d37f63b416e3edff8c9bf4ce7d79a007bd59')
sha256sums_x86_64=('14452694e7f225e72f1aa740530d4b8a92b12d4dfa2cfa514b97afdea96fa65f')
sha256sums_aarch64=('c7a3d727d11c3844318663e9da05f3133138bb8b90cc68e37358540c6c090062')

package() {
  cd "$srcdir"

  install -Dm755 "${_pkgname}-${_pkgtag}-${CARCH}.AppImage" "$pkgdir/opt/g0v0/g0v0.AppImage"
  install -Dm755 -t "$pkgdir/usr/bin" g0v0
  install -Dm644 icon.png "$pkgdir/usr/share/pixmaps/g0v0.png"
  install -Dm644 -t "$pkgdir/usr/share/applications" g0v0.desktop
  install -Dm644 -t "$pkgdir/usr/share/applications" g0v0-uri-handler.desktop
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENCE.md
}
