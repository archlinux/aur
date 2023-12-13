# Maintainer: sgar <swhaat in github>
# Contributor: jbpratt <jbpratt78 at gmail dot com>

pkgname=crc-bin
pkgver=2.30.0
pkgrel=1
pkgdesc="Red Hat CodeReady Containers is a tool that manages a local OpenShift 4.x cluster optimized for testing and development purposes"
url=https://github.com/code-ready/crc
arch=("x86_64")
provides=("crc")
depends=("firewalld" "libvirt" "networkmanager" "qemu-base")
license=("APACHE")

source_x86_64=(
  "crc-v${pkgver}-linux-amd64.tar.xz::https://developers.redhat.com/content-gateway/file/pub/openshift-v4/clients/crc/${pkgver}/crc-linux-amd64.tar.xz"
)
sha256sums_x86_64=('fefbd7f5d9044a2b7c984929fc74fc8ba310674fb16414c4be41be6a9a9403b1')

package() {
  cd "${srcdir}/${pkgname%-*}-linux-${pkgver}-amd64"
  install -Dm755 crc "${pkgdir}/usr/bin/crc"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname%-*}/LICENSE"
}
