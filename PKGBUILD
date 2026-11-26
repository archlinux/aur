# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=mikochi-bin
pkgver=1.14.1
pkgrel=1
pkgdesc="Minimalist file manager with streaming"
arch=('x86_64' 'aarch64')
url="https://github.com/zer0tonin/Mikochi"
license=('MIT')
depends=('glibc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/zer0tonin/Mikochi/${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/mikochi-${pkgver}-linux-amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/mikochi-${pkgver}-linux-arm64.tar.gz")
sha256sums=('2cfc9c30b4527ad08484262900f67ec8ac937d24b916b103e334973bcda78620')
sha256sums_x86_64=('ab5227f7246688d97e29aa2d9bcf38eafbad5af62151b22ff270a8feb23d2c5a')
sha256sums_aarch64=('feb73ba305bcfaab192bebb7fc3bdac1f9ead71a73723bac374dfb6897c16f5f')

package() {
  install -Dm755 "./mikochi-${pkgver}/mikochi" "${pkgdir}/usr/bin/mikochi"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
