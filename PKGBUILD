# Maintainer: Wyrd Company <support@wyrd.company>
pkgname='trowel-bin'
pkgver='0.1.0'
pkgrel=1
pkgdesc='Relay HTTP webhooks into NATS JetStream and JetStream messages out to HTTP or commands'
arch=('x86_64' 'aarch64')
url='https://github.com/wyrd-company/trowel'
license=('Apache-2.0')
provides=('trowel')
conflicts=('trowel')
options=('!strip')
install='trowel-bin.install'
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::https://repo.wyrd.foo/artifacts/trowel/0.1.0/trowel_0.1.0_linux_x86_64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::https://repo.wyrd.foo/artifacts/trowel/0.1.0/trowel_0.1.0_linux_aarch64.tar.gz")
sha256sums_x86_64=('d26f647449abb9edf71c38882341e51ec2ccdc2634471575462aa71c63174c81')
sha256sums_aarch64=('5080b2605bc20a02f42915fe1b476e92c4257d9402711fa5914055fab9d6a32f')

package() {
  install -Dm755 "${srcdir}/trowel" "${pkgdir}/usr/bin/trowel"
  install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "${srcdir}/README.md" "${pkgdir}/usr/share/doc/trowel/README.md"
  install -Dm644 "${srcdir}/packaging/trowel.service" "${pkgdir}/usr/lib/systemd/system/trowel.service"
}
