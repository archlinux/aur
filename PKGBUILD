# Maintainer: erdii <me@erdii.net>

pkgname=calicoctl-bin
pkgver=3.31.3
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
    sha256sums+=('dc920efee0045d352780c73cfdd3f6fbd6eab9fdb0675897095c755715a8fc8d')
    ;;
  aarch64) _pkgarch="arm64"
    sha256sums+=('3cb41949679c963ac42a39c30024b225b53485985b9fb7f1eb6177e86a0ec564')
    ;;
esac


source+=("${pkgname}-${pkgver}::https://github.com/projectcalico/calico/releases/download/v${pkgver}/calicoctl-linux-${_pkgarch}")

package() {
  install -Dm755 "${srcdir}/${pkgname}-${pkgver}" "${pkgdir}/usr/bin/calicoctl"
}
