# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>
# Contributor: Carlo Cabanilla <carlo.cabanilla@gmail.com>

pkgname=cs-script
pkgver=3.30.5.2
pkgrel=1
pkgdesc="Run C# sources like scripts"
arch=('any')
url="https://github.com/oleg-shilo/cs-script"
license=('MIT')
depends=('mono')
source=("${url}/releases/download/v${pkgver}/${pkgname}.7z")
sha256sums=('f24c05f57c179c84ff1ea0b8ff0a072503f2ba83d29d66acf383424ef4400a46')

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
