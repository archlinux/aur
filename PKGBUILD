# Maintainer: Victor <victor@xirion.net>

pkgname=rke-bin
pkgver=1.3.9
pkgrel=1
pkgdesc="Rancher Kubernetes Engine, an extremely simple, lightning fast Kubernetes installer that works everywhere."
arch=('x86_64' 'aarch64' 'arm' 'armv6h' 'armv7h')
url='https://github.com/rancher/rke'
license=('Apache')
provides=('rke')
conflicts=('rke')

case "${CARCH}" in
  x86_64)  _CARCH=amd64 && sha256sums=('fda688bda32fad71784477e979c968e42200aa6e987e916dbecdff8cab21808b');;
  arm*)    _CARCH=arm   && sha256sums=('c0338d8efa46d0c7987adafee26ccb8b1f6315f9908345d729b8f937ffca9ad2');;
  aarch64) _CARCH=arm64 && sha256sums=('5458feac789f8b12478f79de8b8a0f02e79efb241fb37e0cc61ef7038a71be10');;
esac

source=("rke-${pkgver}-${pkgrel}"::"https://github.com/rancher/rke/releases/download/v${pkgver}/rke_linux-${_CARCH}")

package() {
  install -Dm 755 "${srcdir}/rke-${pkgver}-${pkgrel}" "${pkgdir}/usr/bin/rke"
}
