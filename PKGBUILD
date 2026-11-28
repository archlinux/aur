# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=airstore-bin
pkgver=0.1.153
pkgrel=1
pkgdesc="Filesystem for AI agents"
arch=('x86_64')
url="https://github.com/beam-cloud/airstore"
license=('AGPL-3.0-only')
depends=('glibc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/beam-cloud/airstore/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/airstore-${pkgver}-linux-amd64.tar.gz")
sha256sums=('46778e949d4881992df5d2a4bfa2b91ba2a17fdb9c8e8f07f2d178886f3be52c')
sha256sums_x86_64=('ac3eb0d090f189662d096fb7faa34198e23176c3822a94a2f534f151ba516a8c')

package() {
  install -Dm755 "airstore" "${pkgdir}/usr/bin/airstore"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
