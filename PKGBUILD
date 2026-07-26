# Maintainer: Adam Wahab <awahab@adhoc.tools>
_name=soundshed-guitar
pkgname=${_name,,}-bin
pkgver=1.4.0
pkgrel=2
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
sha256sums=('5359afc2c1201fc351c8a61c2eba549f661f4c4e3402a11f7365e4266c11af2d'
            '841f9d304c6bce88380d30c86c8badc89c985548d9b5ad31e0c6c19cb7ca26a9')

package() {
  rm SoundshedGuitar-${pkgver}-Linux-x64.zip
  cp -a $srcdir/{opt,usr} $pkgdir/
  install -Dm644 $srcdir/${_name}.desktop -t "$pkgdir/usr/share/applications"
}
