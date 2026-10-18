# Maintainer: Wyrd Company <support@wyrd.company>
pkgname='trowel-bin'
pkgver='0.2.0'
pkgrel=1
pkgdesc='Relay HTTP webhooks into NATS JetStream and JetStream messages out to HTTP or commands'
arch=('x86_64' 'aarch64')
url='https://github.com/wyrd-company/trowel'
license=('Apache-2.0')
provides=('trowel')
conflicts=('trowel')
options=('!strip')
install='trowel-bin.install'
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::https://repo.wyrd.foo/artifacts/trowel/0.2.0/trowel_0.2.0_linux_x86_64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::https://repo.wyrd.foo/artifacts/trowel/0.2.0/trowel_0.2.0_linux_aarch64.tar.gz")
sha256sums_x86_64=('787bda1d8f12f00c2f07e2540e5428b956d7805173e6ddf1b639a63dbc723bea')
sha256sums_aarch64=('9b70aa5f0c764b6d008a5d3911d2a39d7d1a3f73f8856a4d761850e2e67f5c02')

package() {
  install -Dm755 "${srcdir}/trowel" "${pkgdir}/usr/bin/trowel"
  install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "${srcdir}/README.md" "${pkgdir}/usr/share/doc/trowel/README.md"
  install -Dm644 "${srcdir}/packaging/trowel.service" "${pkgdir}/usr/lib/systemd/system/trowel.service"
}
