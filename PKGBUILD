# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=lean4-bin
_pkgver=4.0.0-m2
pkgver=$(echo "$_pkgver" | sed  's/-/./')
pkgrel=1
pkgdesc="An interactive theorem prover"
arch=('x86_64')
url="https://leanprover.github.io/"
license=('apache')
depends=('glibc')
optdepends=('bash')
provides=('lean4')
conflicts=('lean4')
options=('staticlibs')
source=("LICENSE::https://raw.githubusercontent.com/leanprover/lean4/master/LICENSE")
source_x86_64=("https://github.com/leanprover/lean4/releases/download/v$_pkgver/lean-$_pkgver-linux.tar.gz")
sha256sums=('SKIP')
sha256sums_x86_64=('5ae115d3142f6831724808654959d7cec2ae25d17d0aa04ecbf8ef732c0dc450')


package() {
  cd "lean-$_pkgver-linux"

  mkdir -p "$pkgdir/usr"
  mv * "$pkgdir/usr"

  install -Dm644 "$srcdir/LICENSE" -t "$pkgdir/usr/share/licenses/lean4"
}
