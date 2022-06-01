# Maintainer: Nils Kvist  <robstenklippa@gmail.com>
# Contributor: Nils Kvist <robstenklippa@gmail.com>

pkgname=bwp
pkgver=2022.05.26.1
pkgrel=1
pkgdesc='budlabs wallpaper selector'
arch=('any')
url='https://github.com/budlabs/bwp'
license=('MIT')
groups=()
depends=('bash>=4.0.0')
makedepends=(gawk)
optdepends=('xorg-xrandr: get screen geometry'
            'i3lock: to lock the computer'
            'imagemagick: used to resize and blur images'
            'parallel: convert images in parallel'
            'feh: to set the wallpaper'
            'pngquant: compress blurred images')

source=("https://github.com/budlabs/bwp/archive/$pkgver.tar.gz")
sha256sums=('db2d0398d4db5ae5abe439355ab41831e2d4af1b7af7d1cd7ad03c27f97e2abf')

# sha256sums=('SKIP')
# url='file:///home/bud/git/lab/bwp'
# source=("${pkgname}-${pkgver}::git+$url")

package() {
  cd "$pkgname-$pkgver"

  make DESTDIR="$pkgdir/" PREFIX=/usr install

  install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname" README.md
}
