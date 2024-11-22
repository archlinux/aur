# Maintainer: erdii <me@erdii.net>

pkgname=calicoctl-bin
pkgver=3.29.1
pkgrel=1
pkgdesc='command line tool to manage Calico resources and perform administrative functions'
arch=('x86_64' 'aarch64')
url="https://projectcalico.docs.tigera.io/maintenance/clis/calicoctl/install"
license=('Apache')
provides=('calicoctl')
source=()
sha256sums=()

case "$CARCH" in
  x86_64) _pkgarch="amd64"
    sha256sums+=('2ac849181cb1fb40c61c06d075711025cdb909d80562d078cc548d50a0edcd3d')
    ;;
  aarch64) _pkgarch="arm64"
    sha256sums+=('6f662d316a267854dc5487242ca7ec8ca70c35b52bed258aafb76c2d113643c2')
    ;;
esac


source+=("${pkgname}-${pkgver}::https://github.com/projectcalico/calico/releases/download/v${pkgver}/calicoctl-linux-${_pkgarch}")

package() {
  install -Dm755 "${srcdir}/${pkgname}-${pkgver}" "${pkgdir}/usr/bin/calicoctl"
}
