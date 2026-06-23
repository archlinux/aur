# The name of the folder that contains the source files
folder_name="lucidglyph"

pkgname=("lucidglyph")
pkgver=0.15.0
pkgrel=1
arch=('any')
pkgdesc='Carefully tuned adjustments designed to improve font rendering on Linux systems packaged for Arch Linux.'
source=(
  "$folder_name.zip::https://github.com/maximilionus/lucidglyph/archive/refs/tags/v$pkgver.zip"
)
validpgpkeys=(
  "B7E510C142B88F4B"
)
md5sums=(
  '301502788944dcc2b8a50be37dca8f46' # lucidglyph.zip
)
sha512sums=(
  '1f9fb11b10ee693614828f85966db53bb780f4aa4bf5dfe0910fed672e65f4cca29639a723aaeea1d25c729a960f6478f56b2894acef36f6d5b191befe8c49b6' # lucidglyph.zip
)
makedepends=('git')
depends=(
  "fontconfig"
  "pam"
  "freetype2"
)
license=("GPL-3.0")
url="https://github.com/maximilionus/lucidglyph"

package() {
  cd "$srcdir/lucidglyph-$pkgver/src/modules" || exit 1

  install -d "$pkgdir/etc/fonts/conf.d"
  find fontconfig -type f -exec install -v {} "$pkgdir/etc/fonts/conf.d/" \;

  install -d "$pkgdir/etc/environment.d"
  find environment -type f -exec install -v {} "$pkgdir/etc/environment.d/" \;
}

