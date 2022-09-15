# Maintainer: S0ra <s0ra@duck.com>
pkgname=xkeyclicker-git
_pkgname=xkeyclicker
pkgver=.1.0
pkgrel=1
pkgdesc="A Keyboard autoclicker."
arch=('x86_64')
url="https://github.com/S0raWasTaken/XKeyClicker"
license=('MIT')
makedepends=('rust' 'git')
source=("git+https://github.com/S0raWasTaken/xkeyclicker.git")
sha256sums=('SKIP')

build() {
  cd "${_pkgname}"
  cargo build --release
}

package() {
  cd "$srcdir/$_pkgname"
  install -Dm 755 target/release/xkeyclicker "$pkgdir/usr/bin/xkeyclicker"
  install -Dm 644 LICENSE "$pkgdir/usr/share/licenses/${_pkgname}/LICENSE"
}
