# Maintainer: erdii <me@erdii.net>

pkgname=calicoctl-bin
pkgver=3.25.1
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
    sha256sums+=('13565e5304209ffaa93df3ba722e6f623b66c76057ca8ff5c5864fa13176fe48')
    ;;
  arm*) _pkgarch="armv7"
    sha256sums+=('654a7cbe7f7b781a5c96de7c0012ecf557a907f4da83df6a02a9aad8f1404eb8')
    ;;
  aarch64) _pkgarch="arm64"
    sha256sums+=('83084be5de90a94bfd7a10da5758acbf200ddd68fa24ee4e7e1dedc8935aa41d')
    ;;
esac

source+=("${pkgname}-${pkgver}::https://github.com/projectcalico/calico/releases/download/v${pkgver}/calicoctl-linux-${_pkgarch}")

package() {
  install -Dm755 "${srcdir}/${pkgname}-${pkgver}" "${pkgdir}/usr/bin/calicoctl"
}
