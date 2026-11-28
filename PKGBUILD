# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=cardamon-bin
pkgver=1.0.1
pkgrel=1
pkgdesc="Find unused Prometheus metrics across Grafana and Prometheus"
arch=('x86_64' 'aarch64')
url="https://github.com/dominikhei/cardamon"
license=('Apache-2.0')
depends=('glibc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/dominikhei/cardamon/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/cardamon-v${pkgver}-linux-amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/cardamon-v${pkgver}-linux-arm64.tar.gz")
sha256sums=('97be1dda14949d15e58f6676bbe3de9a97fdfa7221288940732494f5ea52eef4')
sha256sums_x86_64=('d4f93e0bd97802da54b8652ff457acd6edd572a38ba4be65f0b1a2703bbbc05e')
sha256sums_aarch64=('0d23ba79efd07e055ac76118ed7e2e53da922978f2fc723be4f49ced5151bfbe')

package() {
  install -Dm755 "cardamon" "${pkgdir}/usr/bin/cardamon"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
