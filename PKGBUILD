# Maintainer: Paweł Otlewski <pawel@idkcloud.com>

pkgname=rke-bin
pkgver=1.4.3
pkgrel=1
pkgdesc="Rancher Kubernetes Engine, an extremely simple, lightning fast Kubernetes installer that works everywhere."
arch=('x86_64' 'aarch64' 'arm' 'armv6h' 'armv7h')
url='https://github.com/rancher/rke'
license=('Apache')
provides=('rke')
conflicts=('rke')

case "${CARCH}" in
  x86_64)  _CARCH=amd64 && sha256sums=('abd55ee75d8b495b3ad0f93abdb81d07b2e8c58c2c6956f44c881f27fc3c0266');;
  arm*)    _CARCH=arm   && sha256sums=('11202f7202cb6ec5e79b2aeaba38d5df55c3357ea31b009dd06d7c474921cd50');;
  aarch64) _CARCH=arm64 && sha256sums=('16a8cf6353f2a165bf6e6277df839293cdce6d246fbb05e92d7fad31c4612f1b');;
esac

source=("rke-${pkgver}-${pkgrel}"::"https://github.com/rancher/rke/releases/download/v${pkgver}/rke_linux-${_CARCH}")

package() {
  install -Dm 755 "${srcdir}/rke-${pkgver}-${pkgrel}" "${pkgdir}/usr/bin/rke"
}
