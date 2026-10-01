pkgname="lucidglyph"
pkgver=0.16.0
pkgrel=1
arch=("any")
pkgdesc="Carefully tuned adjustments designed to improve font rendering on Linux systems packaged for Arch Linux."
url="https://github.com/maximilionus/lucidglyph"
license=("GPL-3.0")
depends=("fontconfig" "pam" "freetype2")
source=("$pkgname-$pkgver.zip::$url/archive/refs/tags/v$pkgver.zip")
validpgpkeys=("265281061734E45F2BF0489803E9CD3D5C5D378E")
sha512sums=("41fac46c8025e4373dda6499107cdc01c53672973726e7858e394e80c344a1f3c5e79145570ddd95f9c9fec360ede99c647e00bf8f8edefc3dbaf7890f7e2f8f")

package() {
  cd "$srcdir/$pkgname-$pkgver/src/modules" || return 1

  install -d "$pkgdir/etc/fonts/conf.d"
  install -m644 fontconfig/*.conf "$pkgdir/etc/fonts/conf.d/"

  install -d "$pkgdir/etc/environment.d"
  install -m644 environment/*.conf "$pkgdir/etc/environment.d/"
}
