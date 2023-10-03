# Maintainer: Paweł Otlewski <pawel@idkcloud.com>

pkgname=rke-bin
pkgver=1.4.10
pkgrel=1
pkgdesc="Rancher Kubernetes Engine, an extremely simple, lightning fast Kubernetes installer that works everywhere."
arch=('x86_64' 'aarch64' 'arm' 'armv6h' 'armv7h')
url='https://github.com/rancher/rke'
license=('Apache')
provides=('rke')
conflicts=('rke')

case "${CARCH}" in
  x86_64)  _CARCH=amd64 && sha256sums=('151836ef3a404253102ffb35f3ef7b345e4264a6f6eadecb3b54b2caa915c655');;
  arm*)    _CARCH=arm   && sha256sums=('120ef605f62867f25d0e1ee78ee6e72f2a7829e0e80980d455fc700a6379098e');;
  aarch64) _CARCH=arm64 && sha256sums=('d2c04bd033bdcffd5bfc30470a962c60ffe4afeb1dd5af64dc30eeed70efd684');;
esac

source=("rke-${pkgver}-${pkgrel}"::"https://github.com/rancher/rke/releases/download/v${pkgver}/rke_linux-${_CARCH}")

package() {
  install -Dm 755 "${srcdir}/rke-${pkgver}-${pkgrel}" "${pkgdir}/usr/bin/rke"
}
