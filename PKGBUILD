# Maintainer: sgar <swhaat in github>
# Contributor: jbpratt <jbpratt78 at gmail dot com>

pkgname=crc-bin
pkgver=2.49.0
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
b2sums_x86_64=('5fba867945a22c631c9e5f7842749743686f6a4d4b2d9ceb0ffa5bbd2b1f47231e1bd61e5627ca5e66ee7491420817c7e5a4071413fac85eed1660c1f13247c8')

package() {
  cd "${srcdir}/${pkgname%-*}-linux-${pkgver}-amd64"
  install -Dm755 crc "${pkgdir}/usr/bin/crc"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname%-*}/LICENSE"
}
