# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=leeway-bin
pkgver=0.22.2
pkgrel=1
pkgdesc="Heavily caching build system for Go, TypeScript and Docker projects"
arch=('x86_64' 'aarch64')
url="https://github.com/gitpod-io/leeway"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/leeway_Linux_x86_64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/leeway_Linux_arm64.tar.gz")
sha256sums_x86_64=('bfd4d2ed0fb185154b88e6d0cab6ad47456a8ea93238d9411d0b84a4e93c2a07')
sha256sums_aarch64=('73ef699b1d6032f4c178dfde66830b2b38e51ce5dabc6d67b293e2f98e6a5a22')

package() {
  install -Dm755 "leeway" "${pkgdir}/usr/bin/leeway"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
