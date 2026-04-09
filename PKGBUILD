# The name of the folder that contains the source files
folder_name="lucidglyph"

pkgname=("lucidglyph")
pkgver=0.14.0
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
  'c58ba9d67b40538e96fd46e9c1782973' # lucidglyph.zip
)
sha512sums=(
  'e8b9b5db578ab2d8c074c22478f3b160b72d0ddcc2a2bd5b64c3f3c8ce0adc3fa5ad359a3a7bf5f6444d5b3d673a5b2027909b3ef8cb220da47049b5849ddee3' # lucidglyph.zip
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

