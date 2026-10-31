# Maintainer: Wyrd Company <support@wyrd.company>
pkgname='wyrwood-bin'
pkgver='0.4.1'
pkgrel=1
pkgdesc='Filtered SSH-agent endpoints for containers'
arch=('x86_64' 'aarch64')
url='https://github.com/wyrd-company/wyrwood'
license=('Apache-2.0')
provides=('wyrwood')
conflicts=('wyrwood')
options=('!strip')
install='wyrwood-bin.install'
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::https://repo.wyrd.foo/artifacts/wyrwood/0.4.1/wyrwood_0.4.1_linux_x86_64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::https://repo.wyrd.foo/artifacts/wyrwood/0.4.1/wyrwood_0.4.1_linux_aarch64.tar.gz")
sha256sums_x86_64=('95ca40ade78403780f28cc068800dd91e7a3c510b9b214516860fb1ea9a27e7b')
sha256sums_aarch64=('b9946405f28e9e44787865a7b4011e0ecad883830a85fe6f5c0878aa1a6ded3b')

package() {
  install -Dm755 "${srcdir}/wyrwood" "${pkgdir}/usr/bin/wyrwood"
  install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "${srcdir}/README.md" "${pkgdir}/usr/share/doc/wyrwood/README.md"
  install -Dm644 "${srcdir}/packaging/preinstall.sh" "${pkgdir}/usr/lib/wyrwood/preinstall.sh"
  install -Dm644 "${srcdir}/packaging/wyrwood-agent.service" "${pkgdir}/usr/lib/systemd/system/wyrwood-agent.service"
  install -Dm644 "${srcdir}/packaging/wyrwood-engine-proxy.service" "${pkgdir}/usr/lib/systemd/system/wyrwood-engine-proxy.service"
  install -Dm644 "${srcdir}/packaging/wyrwood-engine-upgrade.hook" "${pkgdir}/usr/share/libalpm/hooks/wyrwood-engine-upgrade.hook"
  install -Dm644 "${srcdir}/packaging/wyrwood.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/wyrwood.conf"
}
