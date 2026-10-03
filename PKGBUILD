# Maintainer: sgar <swhaat in github>
# Contributor: jbpratt <jbpratt78 at gmail dot com>

pkgname=crc-bin
pkgver=2.64.0
pkgrel=1
pkgdesc="Red Hat CodeReady Containers is a tool that manages a local OpenShift 4.x cluster optimized for testing and development purposes"
url=https://github.com/code-ready/crc
arch=("x86_64" "aarch64")
provides=("crc")
depends=("firewalld" "libvirt" "networkmanager" "qemu-base")
license=("APACHE")

source_x86_64=("crc-v${pkgver}-linux-amd64.tar.xz::https://developers.redhat.com/content-gateway/rest/mirror/pub/cgw/crc/${pkgver}/crc-linux-amd64.tar.xz")
b2sums_x86_64=('d73775a57816b89f829bbffc6ff6371827627b2536227cb16b5924a7eb9c04df31bd85720acd0f3982e84ff2885e1ceb0396e94e12755a3a5e811da8ff9f564d')

source_aarch64=("crc-v${pkgver}-linux-arm64.tar.xz::https://developers.redhat.com/content-gateway/rest/mirror/pub/cgw/crc/${pkgver}/crc-linux-arm64.tar.xz")
b2sums_aarch64=('2f10490cbd79b36a6bd57ae4848430d48517713e2786af95daa242bd8d1a7c8cd64c1f8a7ed4453a8557a4bb509c451b795675e96fb4be975d8ab9fa8c212808')

package() {
  cd "${srcdir}/${pkgname%-*}-linux-${pkgver}-amd64"
  install -Dm755 crc "${pkgdir}/usr/bin/crc"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname%-*}/LICENSE"
}
