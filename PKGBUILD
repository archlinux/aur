# Maintainer: Paweł Otlewski <pawel@idkcloud.com>

pkgname=rke-bin
pkgver=1.4.5
pkgrel=1
pkgdesc="Rancher Kubernetes Engine, an extremely simple, lightning fast Kubernetes installer that works everywhere."
arch=('x86_64' 'aarch64' 'arm' 'armv6h' 'armv7h')
url='https://github.com/rancher/rke'
license=('Apache')
provides=('rke')
conflicts=('rke')

case "${CARCH}" in
  x86_64)  _CARCH=amd64 && sha256sums=('c6e69a7f6e466d9b4e3bcb85d56da09857a663d26db9155d0e8f33fbda7b1217');;
  arm*)    _CARCH=arm   && sha256sums=('80fa92e7d146f9a69bff98d9c5fc6d4a1e3592a1f9dbdb19f3863663fd6f628e');;
  aarch64) _CARCH=arm64 && sha256sums=('0e5ad0b2400b8d580e91cbc32e9c567bc0b870b6fc86b28b910216eca5ef6bdf');;
esac

source=("rke-${pkgver}-${pkgrel}"::"https://github.com/rancher/rke/releases/download/v${pkgver}/rke_linux-${_CARCH}")

package() {
  install -Dm 755 "${srcdir}/rke-${pkgver}-${pkgrel}" "${pkgdir}/usr/bin/rke"
}
