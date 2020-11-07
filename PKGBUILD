# Maintainer: Avery Murray <averylapine@gmail.com>

_pkgname=proton-call
pkgname=proton-caller-git
__pkgname=Proton-Caller
pkgver=1.4.0
pkgrel=1
pkgdesc="Run any Windows program through Proton"
arch=('x86_64')
url="https://github.com/caverym/Proton-Caller/"
license=('GPL3')
depends=(
  'steam'
  'dxvk'
  'git'
)
conflicts=(proton-caller)

source=("git+https://github.com/caverym/$__pkgname.git")
sha256sums=('SKIP')

build() {
  cd Proton-Caller
  make
}

package() {
  ls
  mkdir -p "$pkgdir"/usr/share/licenses/proton-call/
  mkdir -p "$pkgdir"/usr/bin/
  mkdir -p "$pkgdir"/usr/share/man/man6/
  install -g 0 -o 0 $__pkgname/proton-call "$pkgdir"/usr/bin/
  install -g 0 -o 0 $__pkgname/LICENSE "$pkgdir"/usr/share/licenses/proton-call/
  install -g 0 -o 0 -m 0644 $__pkgname/manual/proton-call.6 "$pkgdir"/usr/share/man/man6/
  gzip -f "$pkgdir"/usr/share/man/man6/proton-call.6
}
