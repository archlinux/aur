# Maintainer: Ludovico Genangeli <genangeliludovico26@gmail.com>
pkgname=ytmplaylistsync
_name="playlistmng"
pkgver=1.2
pkgrel=1
epoch=1
pkgdesc="A covenient way to sync locally all your YTMusic playists"
arch=(any)
url="https://github.com/Nias26/YTMusicPlaylistSync"
license=('MIT')
depends=(
  "yt-dlp>=2025.10.14-1"
  "python-mutagen>=1.47.0-3"
  "python-ytmusicapi>=1.11.1-1"
  "python-halo>=0.0.31-7"
  "python-pyxdg>=0.28-4"
  "python-yaml>=6.0.3-1"
)
source=(
  "playlistmng-$pkgver::https://raw.githubusercontent.com/Nias26/YTMPlaylistSync/refs/tags/v$pkgver/playlistmng"
  "LICENSE::https://raw.githubusercontent.com/Nias26/YTMPlaylistSync/refs/tags/v$pkgver/LICENSE"
)
sha256sums=(
  "6c307fc3beb042a535f66451a71c800a2297511683859aa8cf770094aeb2c472"
  "0afe56a95cbfc12001182dc98ed965083dde7f3f1247c53b611c9ee8dde150fd"
)

check() {
  if ! test $_name; then exit 1; fi
  if ! test "LICENSE"; then exit 1; fi
}

package() {
  install -Dm 755 $_name-$pkgver "$pkgdir/usr/bin/$_name"
  install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
