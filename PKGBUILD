# Maintainer: Victor <victor@xirion.net>

pkgname=rke-bin
pkgver=1.2.4
_pkgver=v$pkgver
pkgrel=1
pkgdesc='Rancher Kubernetes Engine, an extremely simple, lightning fast Kubernetes installer that works everywhere.'
arch=('x86_64' 'aarch64' 'arm' 'armv6h' 'armv7h')
url='https://github.com/rancher/rke'
license=('Apache')
provides=('rke')
conflicts=('rke')
_rke_file=rke-$_pkgver

case "${CARCH}" in
  x86_64)    _CARCH=amd64 && sha256sums=('3981fef5251cfb68fccca4fbbd265cafd3db5bbcbc1089e526c68bd4363ce048');;
  aarch64)   _CARCH=arm64 && sha256sums=('e929479f3fb81183f5136038643e56faca33e6668023e43522365d4cf47da7c3');;
  arm*)      _CARCH=arm   && sha256sums=('cd37caf9ac3cdd161c8b8fca7b4cda5057f4b421f81b07ecb5837c154057e4fd');;
esac

source=($_rke_file::"https://github.com/rancher/rke/releases/download/${_pkgver}/rke_linux-${_CARCH}")

package() {
    install -Dm 755 "$srcdir/$_rke_file" "${pkgdir}/usr/bin/rke"
}
