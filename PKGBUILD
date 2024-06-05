# Maintainer: sgar <swhaat in github>
# Contributor: jbpratt <jbpratt78 at gmail dot com>

pkgname=crc-bin
pkgver=2.36.0
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
b2sums_x86_64=('1007c6738c47b7e908923e47220824a9b28abb974b9b387541999cd2151fdf1689f8f454d441b2c5e42dac0813e83c14579f2d49fb9c171b2fcadd18f5ea712c')

package() {
  cd "${srcdir}/${pkgname%-*}-linux-${pkgver}-amd64"
  install -Dm755 crc "${pkgdir}/usr/bin/crc"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname%-*}/LICENSE"
}
