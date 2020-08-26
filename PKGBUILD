# Maintainer: Victor <victor@xirion.net>

pkgname=rke-bin
pkgver=1.1.5
_pkgver=v$pkgver
pkgrel=1
pkgdesc='Rancher Kubernetes Engine, an extremely simple, lightning fast Kubernetes installer that works everywhere.'
arch=('x86_64' 'aarch64' 'arm' 'armv6h' 'armv7h')
url='https://github.com/rancher/rke'
license=('Apache')
provides=('rke')
_rke_file=rke-$_pkgver

case "${CARCH}" in
  x86_64)    _CARCH=amd64 && sha256sums=('61ee3526c78da66da98f200a7f11030b77483981afc1edc00a58fade0dbfe749');;
  aarch64)   _CARCH=arm64 && sha256sums=('2c9a07dd266536e922acb7708c03b707ef6995cf7aafbdaa5ce9c7a82f2c945d');;
  arm*)      _CARCH=arm   && sha256sums=('568dfbfc2912d5119c594ce3c42ee93f463f933e5ba7ad382fe029a2e74b6f0b');;
esac

source=($_rke_file::"https://github.com/rancher/rke/releases/download/${_pkgver}/rke_linux-${_CARCH}")

package() {
    install -Dm 755 "$srcdir/$_rke_file" "${pkgdir}/usr/bin/rke"
}
