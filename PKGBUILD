# Maintainer: erdii <me@erdii.net>

pkgname=calicoctl-bin
pkgver=3.26.2
pkgrel=1
pkgdesc='command line tool to manage Calico resources and perform administrative functions'
arch=('x86_64' 'aarch64' 'armv7h' 'armv7l')
url="https://projectcalico.docs.tigera.io/maintenance/clis/calicoctl/install"
license=('Apache')
provides=('calicoctl')
source=()
sha256sums=()

case "$CARCH" in
  x86_64) _pkgarch="amd64"
    sha256sums+=('eba9bc34f44801a513c48f730a409dc1ece0ebfd9c1acc21fd3adf0eff93ecdc')
    ;;
  arm*) _pkgarch="armv7"
    sha256sums+=('03f5bb67ebb706a6504fd1ad9a0cbdd8afc0ef1e169833837f89e7324bf82171')
    ;;
  aarch64) _pkgarch="arm64"
    sha256sums+=('44de9118f481a1125e2d50cdfbb55073e744dd8e71d2be45eeb2757302910c67')
    ;;
esac


source+=("${pkgname}-${pkgver}::https://github.com/projectcalico/calico/releases/download/v${pkgver}/calicoctl-linux-${_pkgarch}")

package() {
  install -Dm755 "${srcdir}/${pkgname}-${pkgver}" "${pkgdir}/usr/bin/calicoctl"
}
