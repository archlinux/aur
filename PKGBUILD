# Maintainer: Nauris Steins <me@naurissteins.com>
pkgname=matuwall-bin
_pkgname=matuwall
pkgver=0.5.0
pkgrel=1
pkgdesc="Fast and lightweight wallpaper picker for Wayland"
arch=('x86_64')
url="https://github.com/naurissteins/Matuwall"
license=('GPL-3.0-or-later')
options=('!debug')
depends=('wayland' 'libxkbcommon' 'libpng' 'libjpeg-turbo' 'libwebp')
optdepends=(
  'awww: apply wallpapers'
  'sweetbg: apply wallpapers'
  'matugen: generate colorschemes from the applied wallpaper'
  'python-pywal: generate colorschemes from the applied wallpaper'
)
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname" "$_pkgname-git")
source=("$_pkgname-$pkgver-x86_64-linux.tar.xz::$url/releases/download/v$pkgver/$_pkgname-$pkgver-x86_64-linux.tar.xz")
sha256sums=('09de2d5e84ad4cb8173786b457aca8b6a9b40910e0cc45b0ea876a39f7df1da1')

package() {
  # The tarball already carries the usr/ prefix
  cp -a usr "$pkgdir/usr"
}
