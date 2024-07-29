# Maintainer: haxibami <contact at haxibami dot net>

pkgname=ctrld-bin
pkgver=1.3.7
pkgrel=1
pkgdesc="A highly configurable, multi-protocol DNS forwarding proxy"
arch=('x86_64')
url="https://github.com/Control-D-Inc/ctrld"
license=('MIT')
provides=('ctrld')
source=(
  "${url}/releases/download/v${pkgver}/ctrld_${pkgver}_linux_amd64.tar.gz"
  "ctrld.service"
  "ctrld.toml"
)
sha256sums=('54c1a0db5ea8b7173ed499090f48f4c779b29dc20b31c369ed1b2320ce68952d'
            '0b1dd36bc9706f88949de821d84604cbc9a2534cd2f627ef5303bfc962af72cd'
            '219930e7154545fcd8ef0af7ae90ce91821d692681d2aec5b784820186eaef96')

package() {
  cd "$srcdir/dist/ctrld_${pkgver}_linux_amd64"
  install -Dm755 ctrld "${pkgdir}/usr/bin/ctrld"
  install -Dm644 "${srcdir}/ctrld.service" "${pkgdir}/usr/lib/systemd/system/ctrld.service"
  install -Dm644 "${srcdir}/ctrld.toml" "${pkgdir}/etc/controld/ctrld.toml"
}
