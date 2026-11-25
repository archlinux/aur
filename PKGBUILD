# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=compozy-bin
pkgver=0.7.8
pkgrel=1
pkgdesc="An operating system for AI agents"
arch=('x86_64' 'aarch64')
url="https://github.com/compozy/compozy"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/compozy_linux_x86_64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/compozy_linux_arm64.tar.gz")
sha256sums_x86_64=('b0c515b66d90c6562fad58a4450fffe5fdb7d9e53aa077b5ed9956976a994c8a')
sha256sums_aarch64=('34e309e171b89fbe66e43b243e0631d5122eea7f112db01cd29eea560b0dbd5c')

package() {
  install -Dm755 "compozy" "${pkgdir}/usr/bin/compozy"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
