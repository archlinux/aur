# Maintainer: Victor <victor@xirion.net>

pkgname=rke-bin
pkgver=1.3.0
_pkgver=v$pkgver
pkgrel=1
pkgdesc="Rancher Kubernetes Engine, an extremely simple, lightning fast Kubernetes installer that works everywhere."
arch=('x86_64' 'aarch64' 'arm' 'armv6h' 'armv7h')
url='https://github.com/rancher/rke'
license=('Apache')
provides=('rke')
conflicts=('rke')
_rke_file=rke-$_pkgver

case "${CARCH}" in
  x86_64)    _CARCH=amd64 && sha256sums=('d33d41c3b3175e35e1648515b6e550a87c398c6f3835a03d9933f5d23ffb7d7e');;
  arm*)      _CARCH=arm   && sha256sums=('dcfaae00eb02b82fd754f70cfcd072a5ac51888227eb5d00d89a106255455ca7');;
  aarch64)   _CARCH=arm64 && sha256sums=('bce1a0f200ff216d59205bbb29c18809471e862af0164ced2e3a59ee302c7457');;
esac

source=($_rke_file::"https://github.com/rancher/rke/releases/download/${_pkgver}/rke_linux-${_CARCH}")

package() {
    install -Dm 755 "$srcdir/$_rke_file" "${pkgdir}/usr/bin/rke"
}
