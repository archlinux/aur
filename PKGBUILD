# Maintainer: Rul Envellman <archerartem6@gmail.com>
pkgname=ttf-to-ae3dc-git
pkgver=0.0.0.r0.g0000000
pkgrel=1
pkgdesc="Convert ttf to format for ae3dc engine"
arch=('x86_64')
url="https://github.com/Rul991/ttf-to-ae3dc"
license=('MIT')
depends=()
makedepends=('cargo' 'rust' 'git')
source=("git+$url")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${pkgname%-git}"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${srcdir}/${pkgname%-git}"
  cargo build --release
}

package() {
  cd "${srcdir}/${pkgname%-git}"
  install -Dm755 "target/release/${pkgname%-git}" "$pkgdir/usr/bin/${pkgname%-git}"
}
