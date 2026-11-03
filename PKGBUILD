# Maintainer: Wyrd Company <support@wyrd.company>
pkgname='wyrwood-bin'
pkgver='0.5.0'
pkgrel=1
pkgdesc='Filtered SSH-agent endpoints for containers'
arch=('x86_64' 'aarch64')
url='https://github.com/wyrd-company/wyrwood'
license=('Apache-2.0')
provides=('wyrwood')
conflicts=('wyrwood')
options=('!strip')
install='wyrwood-bin.install'
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::https://repo.wyrd.foo/artifacts/wyrwood/0.5.0/wyrwood_0.5.0_linux_x86_64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::https://repo.wyrd.foo/artifacts/wyrwood/0.5.0/wyrwood_0.5.0_linux_aarch64.tar.gz")
sha256sums_x86_64=('4c32c05fa108e70c76255df133a87c595b053542e1edb9fbf02914dee35ff0fa')
sha256sums_aarch64=('222e361d2aad048fee4b38014116a595623f4b864157fb45622482dd6f4d3073')

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
