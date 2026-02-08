# Maintainer: srsxnsh <me@srsxnsh.xyz>
pkgname=nimbsh
pkgver=0.1.0
pkgrel=1
pkgdesc="A simple shell built in Nim"
arch=('x86_64' 'aarch64')
url="https://github.com/srsxnsh/nimbsh"
license=('GPL')
depends=()
makedepends=('nim' 'git')
source=("${pkgname}-${pkgver}::git+${url}.git#tag=v${pkgver}")
sha256sums=('SKIP')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  nim c -d:release nimbsh.nim
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -Dm755 nimbsh "${pkgdir}/usr/bin/nimbsh"
}
