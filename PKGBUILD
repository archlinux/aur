# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=idpbuilder-bin
pkgver=0.10.2
pkgrel=1
pkgdesc="Spin up a complete internal developer platform with only Docker"
arch=('x86_64' 'aarch64')
url="https://github.com/cnoe-io/idpbuilder"
license=('Apache-2.0')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/idpbuilder-linux-amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/idpbuilder-linux-arm64.tar.gz")
sha256sums_x86_64=('d679cfc14f7a612e517730313952d4c349b8dab03589fa467698fc70a993d5cc')
sha256sums_aarch64=('f381a25b02530915c17ca4a765b226090bb51268deddca6eefc2bd7f8adfca33')

package() {
  install -Dm755 "idpbuilder" "${pkgdir}/usr/bin/idpbuilder"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
