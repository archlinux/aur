# Maintainer: sgar <swhaat in github>
# Contributor: jbpratt <jbpratt78 at gmail dot com>

pkgname=crc-bin
pkgver=2.65.0
pkgrel=1
pkgdesc="Red Hat CodeReady Containers is a tool that manages a local OpenShift 4.x cluster optimized for testing and development purposes"
url=https://github.com/code-ready/crc
arch=("x86_64" "aarch64")
provides=("crc")
depends=("firewalld" "libvirt" "networkmanager" "qemu-base")
license=("APACHE")

source_x86_64=("crc-v${pkgver}-linux-amd64.tar.xz::https://developers.redhat.com/content-gateway/rest/mirror/pub/cgw/crc/${pkgver}/crc-linux-amd64.tar.xz")
b2sums_x86_64=('bc2596ce55aae4c30877dd2c101104fc35b69808037b672ab60da50eaf1e71112f84f319d980c75b0c2ecd797b2bba9dc4d5828e1652b01b492bdcaf16c02c4e')

source_aarch64=("crc-v${pkgver}-linux-arm64.tar.xz::https://developers.redhat.com/content-gateway/rest/mirror/pub/cgw/crc/${pkgver}/crc-linux-arm64.tar.xz")
b2sums_aarch64=('ff3da0a245ee83907eeb3ddbd8a5102c90633ec937adb20a4709df1e247763588ec208f2867cb6113551574ea276aeb14ff120bdadceace27e87b6bcbae2c39e')

package() {
  cd "${srcdir}/${pkgname%-*}-linux-${pkgver}-amd64"
  install -Dm755 crc "${pkgdir}/usr/bin/crc"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname%-*}/LICENSE"
}
