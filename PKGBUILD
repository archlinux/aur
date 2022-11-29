# Maintainer: Paweł Otlewski <pawel@idkcloud.com>

pkgname=rke-bin
pkgver=1.4.1
pkgrel=1
pkgdesc="Rancher Kubernetes Engine, an extremely simple, lightning fast Kubernetes installer that works everywhere."
arch=('x86_64' 'aarch64' 'arm' 'armv6h' 'armv7h')
url='https://github.com/rancher/rke'
license=('Apache')
provides=('rke')
conflicts=('rke')

case "${CARCH}" in
  x86_64)  _CARCH=amd64 && sha256sums=('0db4be307e64549fe2e72b955562df52335b9895cc7ec838927991403f86c7c2');;
  arm*)    _CARCH=arm   && sha256sums=('9c4dcb92e6f04ddcc78c097fc4d4ec19a577a48d93ab42988c3659834e65fccf');;
  aarch64) _CARCH=arm64 && sha256sums=('959556b4a9be1ccf43b769fc92e117ccaa1281352cdadd267c460f6b66f33def');;
esac

source=("rke-${pkgver}-${pkgrel}"::"https://github.com/rancher/rke/releases/download/v${pkgver}/rke_linux-${_CARCH}")

package() {
  install -Dm 755 "${srcdir}/rke-${pkgver}-${pkgrel}" "${pkgdir}/usr/bin/rke"
}

