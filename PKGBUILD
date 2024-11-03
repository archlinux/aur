# Maintainer: erdii <me@erdii.net>

pkgname=calicoctl-bin
pkgver=3.29.0
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
    sha256sums+=('df5048549d72a1f7ea4f61c655699d3b16d8a45873f28c3855c39597b73e8a3d')
    ;;
  arm*) _pkgarch="armv7"
    sha256sums+=('0019dfc4b32d63c1392aa264aed2253c1e0c2fb09216f8e2cc269bbfb8bb49b5')
    ;;
  aarch64) _pkgarch="arm64"
    sha256sums+=('ab23afb283fcdffcf0e1156cdced68d05b6c2b70fd4ea2cbc3189d0ecd43bdfd')
    ;;
esac


source+=("${pkgname}-${pkgver}::https://github.com/projectcalico/calico/releases/download/v${pkgver}/calicoctl-linux-${_pkgarch}")

package() {
  install -Dm755 "${srcdir}/${pkgname}-${pkgver}" "${pkgdir}/usr/bin/calicoctl"
}
