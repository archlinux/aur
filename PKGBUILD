# Maintainer: Redson <redsonbr81@yandex.com>
pkgname=pacw-git
_pkgname=pacw
pkgver=.2.5
pkgrel=1
pkgdesc="Pacman wrapper and utility tool."
arch=('x86_64')
url="https://github.com/S0raWasTaken/pacw"
license=('MIT')
makedepends=('rust' 'git')
source=("git+https://github.com/S0raWasTaken/pacw.git")
sha256sums=('SKIP')

build() {
  cd "${_pkgname}"
  cargo build --release
}

package() {
  cd "$srcdir/$_pkgname"
  install -Dm 755 target/release/pacw "$pkgdir/usr/bin/pacw"
  install -Dm 644 LICENSE "$pkgdir/usr/share/licenses/${_pkgname}/LICENSE"
}
