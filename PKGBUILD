# Maintainer: erdii <me@erdii.net>

pkgname=calicoctl-bin
pkgver=3.32.2
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
    sha256sums+=('fd2ebfc94e63ed34e924cbb8dcdcf3ffc8b264098e58d87069abd46ada2e103a')
    ;;
  aarch64) _pkgarch="arm64"
    sha256sums+=('9235f55386cfd96e2f55393e997efec7768049cf2379a8dffa07e724890a4691')
    ;;
esac


source+=("${pkgname}-${pkgver}::https://github.com/projectcalico/calico/releases/download/v${pkgver}/calicoctl-linux-${_pkgarch}")

package() {
  install -Dm755 "${srcdir}/${pkgname}-${pkgver}" "${pkgdir}/usr/bin/calicoctl"
}
