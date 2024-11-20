# Maintainer: haxibami <contact at haxibami dot net>

pkgname=ctrld-bin
pkgver=1.3.11
pkgrel=1
pkgdesc="A highly configurable, multi-protocol DNS forwarding proxy"
arch=('x86_64')
url="https://github.com/Control-D-Inc/ctrld"
license=('MIT')
provides=('ctrld')
backup=('etc/controld/ctrld.toml')
source=(
  "${url}/releases/download/v${pkgver}/ctrld_${pkgver}_linux_amd64.tar.gz"
  "ctrld.service"
  "ctrld.toml"
)
sha256sums=('6c411fecec4b99104c66c7351d86b69167e27a23429a64be6ef385883c3765d9'
            '0b1dd36bc9706f88949de821d84604cbc9a2534cd2f627ef5303bfc962af72cd'
            '40328c166a329b47072593998170544084725a47e20989be242bbc137d91cd0a')

package() {
  cd "${srcdir}/dist/ctrld_${pkgver}_linux_amd64"
  install -Dm755 ctrld "${pkgdir}/usr/bin/ctrld"
  install -Dm644 "${srcdir}/ctrld.service" "${pkgdir}/usr/lib/systemd/system/ctrld.service"
  install -Dm644 "${srcdir}/ctrld.toml" "${pkgdir}/etc/controld/ctrld.toml"
}
