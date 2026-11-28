# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=dockform-bin
pkgver=0.10.0
pkgrel=1
pkgdesc="Declarative configuration layer on top of Docker Compose"
arch=('x86_64' 'aarch64')
url="https://github.com/gcstr/dockform"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/dockform_v${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/dockform_v${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('6eb010e295d255944917f03f448c4371de616da54ae90e8147e1feec9e4360f4')
sha256sums_aarch64=('96b2debd95612875d92a7ca1810e2d7f76b863503b19cb6bbb11dd98f919f554')

package() {
  install -Dm755 "dockform" "${pkgdir}/usr/bin/dockform"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
