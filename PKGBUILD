# Maintainer: Paweł Otlewski <pawel@idkcloud.com>

pkgname=rke-bin
pkgver=1.5.3
pkgrel=1
pkgdesc="Rancher Kubernetes Engine, an extremely simple, lightning fast Kubernetes installer that works everywhere."
arch=('x86_64' 'aarch64' 'arm' 'armv6h' 'armv7h')
url='https://github.com/rancher/rke'
license=('Apache')
provides=('rke')
conflicts=('rke')

case "${CARCH}" in
  x86_64)  _CARCH=amd64 && sha256sums=('7334b824d3cebca5839d1b4d0dd6c21b65d0d7992e6aad310642a38fefa701f9');;
  arm*)    _CARCH=arm   && sha256sums=('c11aca1885f213c635d3efbde401915416ef337f802efc446641e417ad190244');;
  aarch64) _CARCH=arm64 && sha256sums=('4b97cbdc9639524c19eeb516cdf07826b07983dfcbd9bc96b8357cb4598962c9');;
esac

source=("rke-${pkgver}-${pkgrel}"::"https://github.com/rancher/rke/releases/download/v${pkgver}/rke_linux-${_CARCH}")

package() {
  install -Dm 755 "${srcdir}/rke-${pkgver}-${pkgrel}" "${pkgdir}/usr/bin/rke"
}
