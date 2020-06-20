# Maintainer: Victor <victor@xirion.net>

pkgname=rke-bin
pkgver=1.1.3
_pkgver=v$pkgver
pkgrel=1
pkgdesc='Rancher Kubernetes Engine, an extremely simple, lightning fast Kubernetes installer that works everywhere.'
arch=('x86_64' 'aarch64' 'arm' 'armv6h' 'armv7h')
url='https://github.com/rancher/rke'
license=('Apache')
provides=('rke')
_rke_file=rke-$_pkgver

case "${CARCH}" in
  x86_64)    _CARCH=amd64 && sha256sums=('fcbffe476afc21ca27b86f6b29d4009338436846b79abe41d6e075e1b788186a');;
  aarch64)   _CARCH=arm64 && sha256sums=('0fe3afb7df960c6fac7ad67c8ad3e9b6d39376e6483e17f8a0a6a54fb0ee0868');;
  arm*)      _CARCH=arm   && sha256sums=('91d2accba579658bc7acfcd929b3a0894ceca8cdef307dc6d0a34aa4050c8fa6');;
esac

source=($_rke_file::"https://github.com/rancher/rke/releases/download/${_pkgver}/rke_linux-${_CARCH}")

package() {
    install -Dm 755 "$srcdir/$_rke_file" "${pkgdir}/usr/bin/rke"
}
