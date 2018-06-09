# Maintainer: Carlo Cabanilla <carlo.cabanilla@gmail.com>
pkgname=cs-script
pkgver=3.28.4.0
pkgrel=1
pkgdesc="Run C# sources like scripts"
arch=('any')
url="https://github.com/oleg-shilo/cs-script"
license=('MIT')
depends=('mono')
source=("${url}/releases/download/v${pkgver}/${pkgname}.7z")
sha256sums=('567ee64bb7e3a9c39494cedf277ea762f80a27b1ddf611457c22581218211572')

package() {
  local sharedir="$pkgdir/usr/share/"
  mkdir -p "$sharedir"
  cp -r "$srcdir/$pkgname" "$sharedir"

  local bindir="$pkgdir/usr/bin"
  local cscspath="$bindir/cscs"
  mkdir -p "$bindir"
  echo '#!/bin/sh
/usr/bin/mono /usr/share/cs-script/cscs.exe $*
' > $cscspath
  chmod +x $cscspath
}
