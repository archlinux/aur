# Maintainer: Victor <victor@xirion.net>

pkgname=rke-bin
pkgver=1.2.8
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
  x86_64)    _CARCH=amd64 && sha256sums=('b2f45abe7bab2f78d11ef38d3957636f7799bcd79d476a8620f9c220477c8365');;
  arm*)      _CARCH=arm   && sha256sums=('28914237fdb8c0245f0fc236aa3981b0905fa9ae03d72d30401efa1d2d799c5b');;
  aarch64)   _CARCH=arm64 && sha256sums=('8375d38ff374ec7c69768ec46519c9693c8188277083c7c6c7596044e003f905');;
esac

source=($_rke_file::"https://github.com/rancher/rke/releases/download/${_pkgver}/rke_linux-${_CARCH}")

package() {
    install -Dm 755 "$srcdir/$_rke_file" "${pkgdir}/usr/bin/rke"
}
