# Maintainer: Victor <victor@xirion.net>

pkgname=rke-bin
pkgver=1.2.3
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
  x86_64)    _CARCH=amd64 && sha256sums=('61bb428b4d3111bdbfe58fada000328884262bdfa92cd6dbb620560a903e9c66');;
  aarch64)   _CARCH=arm64 && sha256sums=('328c44bd59ac2ad4413931b0d39fec8f5036b93924dd8113410fb760b15e6a7d');;
  arm*)      _CARCH=arm   && sha256sums=('2e4efa687ae4362c6564026e602caea8df53ff92514edfe23e783e9b0c99bcec');;
esac

source=($_rke_file::"https://github.com/rancher/rke/releases/download/${_pkgver}/rke_linux-${_CARCH}")

package() {
    install -Dm 755 "$srcdir/$_rke_file" "${pkgdir}/usr/bin/rke"
}
