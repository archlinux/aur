# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=lean4-bin
_pkgver=4.0.0-m3
pkgver=$(echo "$_pkgver" | sed  's/-/./')
pkgrel=1
pkgdesc="An interactive theorem prover"
arch=('x86_64')
url="https://leanprover.github.io/"
license=('apache')
depends=('glibc')
optdepends=('bash')
provides=('lean4')
conflicts=('lean4' 'clang' 'lld')
options=('staticlibs')
source=("LICENSE::https://raw.githubusercontent.com/leanprover/lean4/master/LICENSE")
source_x86_64=("https://github.com/leanprover/lean4/releases/download/v$_pkgver/lean-4.0.0-linux.tar.zst")
sha256sums=('SKIP')
sha256sums_x86_64=('69f81fcacfd4c9322eafbf450404fcafbc20702b65fb9b687f9d4dec00ff5990')


package() {
  cd "lean-4.0.0-linux"

  mkdir -p "$pkgdir/usr"
  mv * "$pkgdir/usr"

  install -Dm644 "$srcdir/LICENSE" -t "$pkgdir/usr/share/licenses/lean4"
}
