# Maintainer: Paweł Otlewski <pawel@idkcloud.com>

pkgname=rke-bin
pkgver=1.4.6
pkgrel=1
pkgdesc="Rancher Kubernetes Engine, an extremely simple, lightning fast Kubernetes installer that works everywhere."
arch=('x86_64' 'aarch64' 'arm' 'armv6h' 'armv7h')
url='https://github.com/rancher/rke'
license=('Apache')
provides=('rke')
conflicts=('rke')

case "${CARCH}" in
  x86_64)  _CARCH=amd64 && sha256sums=('12d8fee6f759eac64b3981ef2822353993328f2f839ac88b3739bfec0b9d818c');;
  arm*)    _CARCH=arm   && sha256sums=('e77a1a19fa7ba7d755f4a03b66f4774e34b4910c69a9f557502dedf4b3768d11');;
  aarch64) _CARCH=arm64 && sha256sums=('a82781f71817d1e584d3124792ce07872c3525787b8ad89dbf3c5328f6f55810');;
esac

source=("rke-${pkgver}-${pkgrel}"::"https://github.com/rancher/rke/releases/download/v${pkgver}/rke_linux-${_CARCH}")

package() {
  install -Dm 755 "${srcdir}/rke-${pkgver}-${pkgrel}" "${pkgdir}/usr/bin/rke"
}
