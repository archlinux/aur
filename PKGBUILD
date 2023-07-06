# Maintainer: sgar <swhaat in github>
# Contributor: jbpratt <jbpratt78 at gmail dot com>

pkgname=crc-bin
pkgver=2.22.1
pkgrel=1
pkgdesc="Red Hat CodeReady Containers is a tool that manages a local OpenShift 4.x cluster optimized for testing and development purposes"
url=https://github.com/code-ready/crc
arch=("x86_64")
provides=("crc")
depends=("firewalld" "libvirt" "networkmanager" "qemu")
license=("APACHE")

source_x86_64=("https://developers.redhat.com/content-gateway/file/pub/openshift-v4/clients/crc/${pkgver}/crc-linux-amd64.tar.xz")
sha256sums_x86_64=('8b60c8f357bd0e9404579d9e032ab97f390d7f98abd52787236ee81827a13926')

package() {
  cd "${srcdir}/${pkgname%-*}-linux-${pkgver}-amd64"
  install -Dm755 crc "${pkgdir}/usr/bin/crc"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname%-*}/LICENSE"
}
