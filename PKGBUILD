# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=lean4-bin
pkgver=4.0.0
pkgrel=1
pkgdesc="An interactive theorem prover"
arch=('x86_64' 'aarch64')
url="https://leanprover.github.io/"
license=('Apache')
optdepends=('bash')
provides=("lean4=$pkgver")
conflicts=('lean4')
options=('staticlibs')
source_x86_64=("https://github.com/leanprover/lean4/releases/download/v$pkgver/lean-$pkgver-linux.tar.zst")
source_aarch64=("https://github.com/leanprover/lean4/releases/download/v$pkgver/lean-$pkgver-linux_aarch64.tar.zst")
sha256sums_x86_64=('e074c3b4e4694b2f93864e755096ffa3bcddf1b59c85154fa3cb116bdd778616')
sha256sums_aarch64=('bbffb2130d01535bf339ec0727eec7b0839d250d8e2f73e231a2bc487ff05885')


package() {
  cd "lean-4.0.0-linux"

  mkdir -p "$pkgdir/opt/lean4"
  mv * "$pkgdir/opt/lean4"

  mkdir -p "$pkgdir/usr/bin"
  ln -s "/opt/lean4/bin"/{lake,lean,leanc,leanmake} "$pkgdir/usr/bin"

  install -Dm644 "$pkgdir/opt/lean4/LICENSES" -t "$pkgdir/usr/share/licenses/lean4"
}
