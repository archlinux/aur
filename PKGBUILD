# Maintainer: Victor <victor@xirion.net>

pkgname=rke-bin
pkgver=1.1.6
_pkgver=v$pkgver
pkgrel=1
pkgdesc='Rancher Kubernetes Engine, an extremely simple, lightning fast Kubernetes installer that works everywhere.'
arch=('x86_64' 'aarch64' 'arm' 'armv6h' 'armv7h')
url='https://github.com/rancher/rke'
license=('Apache')
provides=('rke')
_rke_file=rke-$_pkgver

case "${CARCH}" in
  x86_64)    _CARCH=amd64 && sha256sums=('965f7b34d38fc15509345d9b6ba84d624e9bd00697d528f719ad5d2ac54108eb');;
  aarch64)   _CARCH=arm64 && sha256sums=('43d04829b04a512114419bb841a6411e1a94bf88348bb48d5710b4337d246f94');;
  arm*)      _CARCH=arm   && sha256sums=('9d19f1073c77913e604d970c28a0fe52d7515dd286fec45f5d3817061a000535');;
esac

source=($_rke_file::"https://github.com/rancher/rke/releases/download/${_pkgver}/rke_linux-${_CARCH}")

package() {
    install -Dm 755 "$srcdir/$_rke_file" "${pkgdir}/usr/bin/rke"
}
