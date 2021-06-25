pkgname=mpv-playlistmanager-git
_pkgname=${pkgname%-git}
pkgver=r224.1c2c880
pkgrel=1
pkgdesc="Mpv lua script to create and manage playlists."
arch=('any')
url="https://github.com/jonniek/mpv-playlistmanager"
license=('Unlicense')
depends=('mpv')
makedepends=('git')
provides=('mpv-playlistmanager')
source=("$_pkgname::git+$url")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$_pkgname"
  install -Dm 755 playlistmanager.lua "$pkgdir/usr/share/mpv/scripts/playlistmanager.lua"
}
