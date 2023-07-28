# Maintainer: Paweł Otlewski <pawel@idkcloud.com>

pkgname=rke-bin
pkgver=1.4.7
pkgrel=1
pkgdesc="Rancher Kubernetes Engine, an extremely simple, lightning fast Kubernetes installer that works everywhere."
arch=('x86_64' 'aarch64' 'arm' 'armv6h' 'armv7h')
url='https://github.com/rancher/rke'
license=('Apache')
provides=('rke')
conflicts=('rke')

case "${CARCH}" in
  x86_64)  _CARCH=amd64 && sha256sums=('a4bc8eb4b486d5b25d7892081130938e8ea940b956e60111ab7cebbe0eed4d3b');;
  arm*)    _CARCH=arm   && sha256sums=('a5d28cc304c884350dc4b8382aeae10e6863b63dfd4ad53a9e1966025922769e');;
  aarch64) _CARCH=arm64 && sha256sums=('9bedc7ee88e32c22071e2feea4c2225d8754b858da3b4441b955037640484b1f');;
esac

source=("rke-${pkgver}-${pkgrel}"::"https://github.com/rancher/rke/releases/download/v${pkgver}/rke_linux-${_CARCH}")

package() {
  install -Dm 755 "${srcdir}/rke-${pkgver}-${pkgrel}" "${pkgdir}/usr/bin/rke"
}
