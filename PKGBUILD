# Maintainer: Auteiy <dmitry@auteiy.me>

pkgname=posy-cursors
pkgver=3.5.1
pkgrel=1
pkgdesc="Port of Posy's improved cursors"
arch=(any)
url="https://git.auteiy.me/dmitry/cursorsPosy"
license=(unknown)
makedepends=("imagemagick" "xorg-xcursorgen")
source=("$pkgname-$pkgver.tar.gz::https://git.auteiy.me/dmitry/cursorsPosy/-/archive/v$pkgver/cursorsPosy-v$pkgver.tar.gz")
sha256sums=('0f751c73d7359c857643e0b7c685fd162784c627ba525901b7730ebc504674c6')

prepare() {
  cd cursorsPosy-v$pkgver
  # Remove prebuilt assets
  rm -rf posy-*
}

build() {
  cd cursorsPosy-v$pkgver
  bash create.sh
}

package() {
  cd cursorsPosy-v$pkgver
  install -Ddm755 "$pkgdir/usr/share/icons"
  cp -dr --no-preserve=ownership posy-white/ "$pkgdir/usr/share/icons/posy-white"
  cp -dr --no-preserve=ownership posy-black/ "$pkgdir/usr/share/icons/posy-black"
  cp -dr --no-preserve=ownership posy-white-tiny/ "$pkgdir/usr/share/icons/posy-white-tiny"
  cp -dr --no-preserve=ownership posy-black-tiny/ "$pkgdir/usr/share/icons/posy-black-tiny"
}
