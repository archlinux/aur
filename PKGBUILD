# Maintainer: Wyrd Company <support@wyrd.company>
pkgname='trowel-bin'
pkgver='0.3.0'
pkgrel=1
pkgdesc='Relay HTTP webhooks into NATS JetStream and JetStream messages out to HTTP or commands'
arch=('x86_64' 'aarch64')
url='https://github.com/wyrd-company/trowel'
license=('Apache-2.0')
provides=('trowel')
conflicts=('trowel')
options=('!strip')
install='trowel-bin.install'
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::https://repo.wyrd.foo/artifacts/trowel/0.3.0/trowel_0.3.0_linux_x86_64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::https://repo.wyrd.foo/artifacts/trowel/0.3.0/trowel_0.3.0_linux_aarch64.tar.gz")
sha256sums_x86_64=('05a10ff51df10ad229eda3509c611ab8a7b8ef7f0835816b0f634cd7cb387202')
sha256sums_aarch64=('e333d50b3f03a97f97d46c0629e2d10224b6f8288aff83f7314887e83f432fc7')

package() {
  install -Dm755 "${srcdir}/trowel" "${pkgdir}/usr/bin/trowel"
  install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "${srcdir}/README.md" "${pkgdir}/usr/share/doc/trowel/README.md"
  install -Dm644 "${srcdir}/packaging/trowel.service" "${pkgdir}/usr/lib/systemd/system/trowel.service"
}
