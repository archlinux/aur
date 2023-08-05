# Maintainer: erdii <me@erdii.net>

pkgname=calicoctl-bin
pkgver=3.26.1
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
    sha256sums+=('c8f61c1c8e2504410adaff4a7255c65785fe7805eebfd63340ccd3c472aa42cf')
    ;;
  arm*) _pkgarch="armv7"
    sha256sums+=('e0083216053b5eb05d5d4ce641506c8cad62fac79ed96a05921a7410144ffb43')
    ;;
  aarch64) _pkgarch="arm64"
    sha256sums+=('bba2fbdd6d2998bca144ae12c2675d65c4fbf51c0944d69b1b2f20e08cd14c22')
    ;;
esac

source+=("${pkgname}-${pkgver}::https://github.com/projectcalico/calico/releases/download/v${pkgver}/calicoctl-linux-${_pkgarch}")

package() {
  install -Dm755 "${srcdir}/${pkgname}-${pkgver}" "${pkgdir}/usr/bin/calicoctl"
}
