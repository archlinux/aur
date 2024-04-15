# Maintainer: erdii <me@erdii.net>

pkgname=calicoctl-bin
pkgver=3.27.3
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
    sha256sums+=('e22b8bb41684f8ffb5143b50bf3b2ab76985604d774d397cfb6fb11d8a19f326')
    ;;
  arm*) _pkgarch="armv7"
    sha256sums+=('2ed29a84ddccc4f7e1c9683ab4bb5f5569c968d1b0ce0ca2d7fcaf75f319166a')
    ;;
  aarch64) _pkgarch="arm64"
    sha256sums+=('1fc5f58a18d8b1c487b4663fc5cbe23b45bd9d31617debd309f6dfac7c11a8ef')
    ;;
esac


source+=("${pkgname}-${pkgver}::https://github.com/projectcalico/calico/releases/download/v${pkgver}/calicoctl-linux-${_pkgarch}")

package() {
  install -Dm755 "${srcdir}/${pkgname}-${pkgver}" "${pkgdir}/usr/bin/calicoctl"
}
