# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=docker-run-bin
pkgver=1.9.0
pkgrel=1
pkgdesc="API for running untrusted code in containers"
arch=('x86_64')
url="https://github.com/glotcode/docker-run"
license=('MIT')
depends=('glibc' 'libgcc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/glotcode/docker-run/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/docker-run_linux-x64.tar.gz")
sha256sums=('c9348d35e84a618e2a5502d246b40ba0b2a7bd066a36dce551c3c2e4724e891c')
sha256sums_x86_64=('299019d1e5c2963ac730554e68580f8c9185299cd1e26f3fe686787ffc5fdcf6')

package() {
  install -Dm755 "docker-run" "${pkgdir}/usr/bin/docker-run"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
