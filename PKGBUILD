# Maintainer: Paweł Otlewski <pawel@idkcloud.com>

pkgname=rke-bin
pkgver=1.4.2
pkgrel=1
pkgdesc="Rancher Kubernetes Engine, an extremely simple, lightning fast Kubernetes installer that works everywhere."
arch=('x86_64' 'aarch64' 'arm' 'armv6h' 'armv7h')
url='https://github.com/rancher/rke'
license=('Apache')
provides=('rke')
conflicts=('rke')

case "${CARCH}" in
  x86_64)  _CARCH=amd64 && sha256sums=('9c4f43b0c4bbe918f9fcd3d1e763752b7eea21d49218dcbf3944b39e3aee09c3');;
  arm*)    _CARCH=arm   && sha256sums=('cc81ae34b96fc2c4ec0fea48c07e565e76f1f00b3a312c31c96f19ede8b35cb8');;
  aarch64) _CARCH=arm64 && sha256sums=('6dbd048ca70680ee5c28b1a35363a42938df7f6e62a98715baba167c00c76aa9');;
esac

source=("rke-${pkgver}-${pkgrel}"::"https://github.com/rancher/rke/releases/download/v${pkgver}/rke_linux-${_CARCH}")

package() {
  install -Dm 755 "${srcdir}/rke-${pkgver}-${pkgrel}" "${pkgdir}/usr/bin/rke"
}
