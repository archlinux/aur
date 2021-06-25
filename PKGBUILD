# Maintainer: Luke Street <luke@street.dev>

_pkgname=ghidra-gekko-broadway-lang
pkgname=ghidra-gekko-broadway-lang-git
pkgver=r22.g7257b32
pkgrel=1
pkgdesc="Ghidra language definition for GameCube/Wii"
url=https://github.com/encounter/${_pkgname}
arch=('any')
license=('Apache 2.0')
depends=('ghidra')
makedepends=('git' 'unzip')
source=("$_pkgname::git+${url}#branch=merged")
sha512sums=('SKIP')

pkgver() {
  cd $srcdir/${_pkgname}
  echo "r$(git rev-list --count HEAD).g$(git rev-parse --short HEAD)"
}

package() {
  cd $srcdir/${_pkgname}
  install -d $pkgdir/opt/ghidra/Ghidra/Processors/PowerPC/data/languages
  cp -r data/languages/* $pkgdir/opt/ghidra/Ghidra/Processors/PowerPC/data/languages
  install -Dm 644 LICENSE.txt -t $pkgdir/usr/share/licenses/$pkgname
}
