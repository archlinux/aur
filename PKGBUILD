# Maintainer: b1f6c1c4 <b1f6c1c4@gmail.com>

_pkgname=sv2v
pkgname=${_pkgname}-git
pkgver=0.0.9.r10.4c3dcf5
pkgrel=1
pkgdesc='SystemVerilog to Verilog conversion'
arch=('x86_64')
url='https://github.com/zachjs/sv2v'
license=('custom: BSD3')
makedepends=('git' 'stack' 'alex' 'happy')
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
  git -C "$_pkgname" describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  make -C "$_pkgname"
}

package() {
  install -Dm755 -t "$pkgdir/usr/bin" "$_pkgname/bin/$_pkgname"
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" "$_pkgname/LICENSE"
}
