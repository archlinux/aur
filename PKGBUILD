# Maintainer: Victor <victor@xirion.net>

pkgname=rke-bin
pkgver=1.1.2
_pkgver=v$pkgver
pkgrel=3
pkgdesc='Rancher Kubernetes Engine, an extremely simple, lightning fast Kubernetes installer that works everywhere.'
arch=('x86_64' 'aarch64' 'arm' 'armv6h' 'armv7h')
url='https://github.com/rancher/rke'
license=('Apache')
provides=('rke')
_rke_file=rke-$_pkgver

case "${CARCH}" in
  x86_64)    _CARCH=amd64 && sha256sums=('4037709ae20aab7d21ae0bac4ce2c14731f2e0df8f24adbd14b96355eae81231');;
  aarch64)   _CARCH=arm64 && sha256sums=('7ec118b62d9d7c10ea649fa067aa0be316d2e499ce68f120655b4c07d6e8580b');;
  arm*)      _CARCH=arm   && sha256sums=('01a3f0d8d915b6e722201ce2167f8009da7cc91e5542d3077a5ea672790a24ff');;
esac

source=($_rke_file::"https://github.com/rancher/rke/releases/download/${_pkgver}/rke_linux-${_CARCH}")

package() {
    install -Dm 755 "$srcdir/$_rke_file" "${pkgdir}/usr/bin/rke"
}
