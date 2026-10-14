# Maintainer: Adam Wahab <awahab@adhoc.tools>
_name=soundshed-guitar
pkgname=${_name,,}-bin
pkgver=1.6.0
pkgrel=0
pkgdesc="A guitar/bass effects app and plugin."
arch=(x86_64)
url="https://guitar.soundshed.com"
license=(AGPL-3.0)
depends=(webkit2gtk-4.1)
makedepends=('unzip')
options=()
provides=("${_name}")
conflicts=("${_name}")
source=(
"https://downloads.soundshed.com/downloads/SoundshedGuitar-${pkgver}-Linux-x64.zip"
"$_name.desktop"
)
sha256sums=('092be634599821c0629feccbd575d52e3de3033f4e61e9a6bc1356803ef3fb9c'
            '841f9d304c6bce88380d30c86c8badc89c985548d9b5ad31e0c6c19cb7ca26a9')

package() {
  rm SoundshedGuitar-${pkgver}-Linux-x64.zip
  cp -a $srcdir/{opt,usr} $pkgdir/
  install -Dm644 $srcdir/${_name}.desktop -t "$pkgdir/usr/share/applications"
}
