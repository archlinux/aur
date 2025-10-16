# Maintainer: Ludovico Genangeli <genangeliludovico26@gmail.com>
pkgname=ytmplaylistsync
_name="playlistmng"
pkgver=1.0
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
  "playlistmng-$pkgver.tar.gz::https://github.com/Nias26/YTMPlaylistSync/releases/download/v$pkgver/playlistmng.tar.gz"
  "LICENSE::https://github.com/Nias26/YTMPlaylistSync/releases/download/v1.0/LICENSE"
)
sha256sums=(
  "9f873d43ed258ea0d15afc2adce94a614ad3aca44661832e5010fc5142d9a984"
  "0afe56a95cbfc12001182dc98ed965083dde7f3f1247c53b611c9ee8dde150fd"
)

check() {
  if ! test $_name; then exit 1; fi
  if ! test "LICENSE"; then exit 1; fi
}

package() {
  install -Dm 755 $_name "$pkgdir/usr/bin/$_name"
  install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
