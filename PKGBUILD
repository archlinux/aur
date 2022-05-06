# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=lean4-bin
_pkgver=4.0.0-m4
pkgver=$(echo "$_pkgver" | sed  's/-/./')
pkgrel=2
pkgdesc="An interactive theorem prover"
arch=('x86_64')
url="https://leanprover.github.io/"
license=('apache')
optdepends=('bash')
provides=("lean4=$pkgver")
conflicts=('lean4')
options=('staticlibs')
source=("LICENSE::https://raw.githubusercontent.com/leanprover/lean4/master/LICENSE")
source_x86_64=("https://github.com/leanprover/lean4/releases/download/v$_pkgver/lean-4.0.0-linux.tar.zst")
sha256sums=('SKIP')
sha256sums_x86_64=('403248a2aed37eb610ea9302294c1b46e160a99b008c7f4222cd66646816d382')


package() {
  cd "lean-4.0.0-linux"

  mkdir -p "$pkgdir/opt/lean4"
  mv * "$pkgdir/opt/lean4"

  mkdir -p "$pkgdir/usr/bin"
  ln -s "/opt/lean4/bin"/{lake,lean,leanc,leanmake,leanpkg} "$pkgdir/usr/bin"

  install -Dm644 "$srcdir/LICENSE" -t "$pkgdir/usr/share/licenses/lean4"
}
