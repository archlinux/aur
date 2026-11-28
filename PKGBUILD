# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=graph-go-bin
pkgver=0.4.0
pkgrel=1
pkgdesc="Simple node and graph visualization tool"
arch=('x86_64' 'aarch64')
url="https://github.com/guilherme-grimm/graph-go"
license=('AGPL-3.0-only')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/graph-go_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/graph-go_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('7c1a3c1370f86c0094230e53ed950a488ddaf477e0e314aecb96e12a34af7dab')
sha256sums_aarch64=('3cba7a85246d864df38d8ab89ba4fbdaf510ee4e070dd6a846cf1cf967538140')

package() {
  install -Dm755 "graph-go" "${pkgdir}/usr/bin/graph-go"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
