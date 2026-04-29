# Maintainer: archikarol <karollinux14@gmail.com>
pkgname=xsh-git
pkgver=1.2.8
pkgrel=1
pkgdesc="ye dawg"
arch=('x86_64')
url="https://github.com/ediwq14/xsh"
license=('MIT')
depends=('gcc-libs')
makedepends=('rust' 'cargo' 'git')
source=("git+https://github.com/ediwq14/xsh.git")
sha256sums=('SKIP')

build() {
  cd "${srcdir}/xsh"
  cargo build --release --locked
}

package() {
  cd "${srcdir}/xsh"
  install -Dm755 "target/release/xsh" "${pkgdir}/usr/bin/xsh"
}
