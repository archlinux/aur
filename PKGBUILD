# Maintainer: Nils Kvist  <robstenklippa@gmail.com>
# Contributor: Nils Kvist <robstenklippa@gmail.com>

pkgname=bwp
pkgver=2019.08.25.4
pkgrel=1
pkgdesc='budlabs wallpaper selector'
arch=('any')
url='https://github.com/budlabs/bwp'
license=('MIT')
groups=()
depends=('bash>=4.0.0')
makedepends=()
optdepends=('xorg-xrandr: get screen geometry'
            'i3lock: to lock the computer'
            'imagemagick: used to resize and blur images'
            'parallel: convert images in parallel'
            'feh: to set the wallpaper'
            'pngquant: compress blurred images')
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("https://github.com/budlabs/bwp/archive/$pkgver.tar.gz")
noextract=()
sha256sums=('3cd24205bb7a7f87885e3e57b68deafe41934931fa6123eb82b16babad64a045')

package() {
  ls
  cd "$pkgname-$pkgver"

  make DESTDIR="$pkgdir/" PREFIX=/usr install

  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
  install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname" README.md
}
