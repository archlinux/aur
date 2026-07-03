# Maintainer: Neuwj <neuwj@linuxmail.org>
pkgname=uninstaller
pkgver=1.0.0
pkgrel=1
pkgdesc="A minimal and modern terminal package uninstaller written in Rust"
arch=('x86_64')
url="https://github.com/Neuwj-00/uninstaller"
license=('GPL3')
depends=('gcc-libs')
makedepends=('cargo')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/Neuwj-00/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('SKIP')

build() {
  cd "${pkgname}-${pkgver}"
  cargo build --release --locked
}

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm755 "target/release/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}
