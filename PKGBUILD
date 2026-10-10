# Maintainer: Nauris Steins <me@naurissteins.com>
pkgname=matuwall-bin
_pkgname=matuwall
pkgver=0.3.2
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
source=(
  "$_pkgname-$pkgver-x86_64-linux.tar.xz::$url/releases/download/v$pkgver/$_pkgname-$pkgver-x86_64-linux.tar.xz"
  "LICENSE::https://raw.githubusercontent.com/naurissteins/Matuwall/v$pkgver/LICENSE"
)
sha256sums=('73ef257b86fb59e5987c2c405f63dab23fbb41801a52416ffc7fc576d958eca6'
            '3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986')

package() {
  # The tarball already carries the usr/ prefix
  cp -a usr "$pkgdir/usr"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
