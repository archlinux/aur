# Maintainer: Paweł Otlewski <pawel@idkcloud.com>

pkgname=rke-bin
pkgver=1.4.4
pkgrel=1
pkgdesc="Rancher Kubernetes Engine, an extremely simple, lightning fast Kubernetes installer that works everywhere."
arch=('x86_64' 'aarch64' 'arm' 'armv6h' 'armv7h')
url='https://github.com/rancher/rke'
license=('Apache')
provides=('rke')
conflicts=('rke')

case "${CARCH}" in
  x86_64)  _CARCH=amd64 && sha256sums=('43ae16ae1c262db97a0191e90e836201c01d6bea0ad48d9b86c68a8c5d4dba9d');;
  arm*)    _CARCH=arm   && sha256sums=('a8a665d3ee5ac81ffa25ab1cdcd29ce6a1907c1caf8e69f1b6fb03132c79fdbd');;
  aarch64) _CARCH=arm64 && sha256sums=('8927c9edef9b94cda20e53a409a0eda60674ff616ff8e75d27fcc24c1b4e415f');;
esac

source=("rke-${pkgver}-${pkgrel}"::"https://github.com/rancher/rke/releases/download/v${pkgver}/rke_linux-${_CARCH}")

package() {
  install -Dm 755 "${srcdir}/rke-${pkgver}-${pkgrel}" "${pkgdir}/usr/bin/rke"
}
