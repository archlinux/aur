# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=helm-tui-bin
pkgver=0.6.0
pkgrel=1
pkgdesc="Simple terminal UI for Helm"
arch=('x86_64' 'aarch64')
url="https://github.com/pidanou/helm-tui"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/helm-tui_Linux_x86_64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/helm-tui_Linux_arm64.tar.gz")
sha256sums_x86_64=('efba516280765dcfa290383c3f38f5817bbe043fd2d10c93118a1fd31bd24cee')
sha256sums_aarch64=('7330dd3fd09e9c21bbffff2ab0ffcc794d5d6a70a12a99acbd33b9a476a830c1')

package() {
  install -Dm755 "helm-tui" "${pkgdir}/usr/bin/helm-tui"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
