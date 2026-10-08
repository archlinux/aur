# Maintainer: k1f0 <archlinux at k1f0.mozmail.com>

case "$CARCH" in
  x86_64) _debarch="amd64" ;;
  aarch64) _debarch="arm64" ;;
esac

pkgname=eosctl
pkgver=0.16.0
pkgrel=1
pkgdesc='Software for managing eos cloud.'
depends=('bash-completion')
arch=('x86_64' 'aarch64')
url='https://dl.eoscloud.io/eosctl'
source=("${pkgname}-${pkgver}::${url}/archives/v${pkgver}/eosctl_${pkgver}_linux_${_debarch}.pacman")
sha256sums=('82c0281a66f2ef3cd74beaaceb6a01ebb906d942841ed54d70520195dafa8103')
options=(!debug !lto)

package() {
  bsdtar -xf "${srcdir}/${pkgname}-${pkgver}" -C "$pkgdir"

  # remove package metadata
  rm -rf "${pkgdir}/.PKGINFO" \
    "${pkgdir}/.MTREE" \
    "${pkgdir}/.BUILDINFO" \
    "${pkgdir}/.INSTALL" \
    "${pkgdir}/.CHANGELOG"
}
