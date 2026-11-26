# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=komoplane-bin
pkgver=0.2.1
pkgrel=1
pkgdesc="Crossplane troubleshooting tool"
arch=('x86_64' 'aarch64')
url="https://github.com/komodorio/komoplane"
license=('Apache-2.0')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/komoplane_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/komoplane_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('06ed121c646c57a22b7c7c41343a8f4e87392c77b937d493174aa087cd037011')
sha256sums_aarch64=('14506a180de4d52d1c47c4b83505e25c3c2c1e11121eea6e2ad2993ff44dfdc0')

package() {
  install -Dm755 "komoplane" "${pkgdir}/usr/bin/komoplane"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
