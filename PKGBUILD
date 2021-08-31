# Maintainer: Atom Long <atom.long@hotmail.com>

pkgname=shadowsocks-helper
pkgver=0.10.0
pkgrel=1
pkgdesc='Shadowsocks helper utility'
arch=('any')
url='https://github.com/honwen/shadowsocks-helper'
license=('Apache')
makedepends=('go')
source=(${pkgname}-${pkgver}.tar.gz::"https://github.com/honwen/shadowsocks-helper/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('0ecd90fffe785a67725c8ec1d7102abee3fcf028dffe1daf53cd3a09791733ce')
provides=('shadowsocks-helper')
conflicts=('shadowsocks-helper-git')

build() {
  cd "${pkgname}-${pkgver}"
  go build -o release/shadowsocks-helper
}

package() {
  cd "${pkgname}-${pkgver}"
  # binary
  install -D -m755 release/shadowsocks-helper "${pkgdir}/usr/bin/shadowsocks-helper"
  # doc files
  install -D -m644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
