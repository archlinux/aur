# Maintainer: Victor <victor@xirion.net>

pkgname=rke-bin
pkgver=1.2.1
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
  x86_64)    _CARCH=amd64 && sha256sums=('e1e288d557cea6140f16ba6659fe427fb7431c3cd62cc67f2cdfdf415a4012da');;
  aarch64)   _CARCH=arm64 && sha256sums=('2c0f0f5af8d2231d18d2ff35a3c658be666521b7fb7eef1627af8f8840a58048');;
  arm*)      _CARCH=arm   && sha256sums=('d8303f38314490ca0638f8d97931cf8c1fd324260715200fb4aeabf1d3a33ef4');;
esac

source=($_rke_file::"https://github.com/rancher/rke/releases/download/${_pkgver}/rke_linux-${_CARCH}")

package() {
    install -Dm 755 "$srcdir/$_rke_file" "${pkgdir}/usr/bin/rke"
}
