# Maintainer: erdii <me@erdii.net>

pkgname=calicoctl-bin
pkgver=3.33.0
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
    sha256sums+=('dcc97928356bccb3ddb8d036adbdbdb6a3c3e3d5ff70d38878f1053f7ca89f8a')
    ;;
  aarch64) _pkgarch="arm64"
    sha256sums+=('8d22c77d8296e28fba2098c92b17b20497d67424282e3c4d374f71b6249543e8')
    ;;
esac


source+=("${pkgname}-${pkgver}::https://github.com/projectcalico/calico/releases/download/v${pkgver}/calicoctl-linux-${_pkgarch}")

package() {
  install -Dm755 "${srcdir}/${pkgname}-${pkgver}" "${pkgdir}/usr/bin/calicoctl"
}
