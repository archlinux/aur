# Maintainer: Adam Wahab <awahab@adhoc.tools>
_name=soundshed-guitar
pkgname=${_name,,}-bin
pkgver=1.7.1
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
"https://downloads.soundshed.com/downloads/${pkgver}/SoundshedGuitar-${pkgver}-Linux-x64.zip"
"$_name.desktop"
)
sha256sums=('a7e4be4959a0faab3040b9b5459f4ecace82dee6651e13d56a9e31b020787a91'
            '841f9d304c6bce88380d30c86c8badc89c985548d9b5ad31e0c6c19cb7ca26a9')

package() {
  rm SoundshedGuitar-${pkgver}-Linux-x64.zip
  cp -a $srcdir/{opt,usr} $pkgdir/
  install -Dm644 $srcdir/${_name}.desktop -t "$pkgdir/usr/share/applications"
}
