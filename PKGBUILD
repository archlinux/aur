# Maintainer: Victor <victor@xirion.net>

pkgname=rke-bin
pkgver=1.3.3
pkgrel=1
pkgdesc="Rancher Kubernetes Engine, an extremely simple, lightning fast Kubernetes installer that works everywhere."
arch=('x86_64' 'aarch64' 'arm' 'armv6h' 'armv7h')
url='https://github.com/rancher/rke'
license=('Apache')
provides=('rke')
conflicts=('rke')

case "${CARCH}" in
  x86_64)  _CARCH=amd64 && sha256sums=('61088847d80292f305e233b7dff4ac8e47fefdd726e5245052450bf05da844aa');;
  arm*)    _CARCH=arm   && sha256sums=('dad1030a3065607660d31aac5f8245c2ae1078ab051cd4a134a0fe78313a5ee4');;
  aarch64) _CARCH=arm64 && sha256sums=('9650082c93f92bc4a42b609253077e344958b007ccce65177db4d30cca4f8287');;
esac

source=("https://github.com/rancher/rke/releases/download/v${pkgver}/rke_linux-${_CARCH}")

package() {
  install -Dm 755 "${srcdir}/rke_linux-${_CARCH}" "${pkgdir}/usr/bin/rke"
}
