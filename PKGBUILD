# Maintainer: Victor <victor@xirion.net>

pkgname=rke-bin
pkgver=1.2.9
_pkgver=v$pkgver
pkgrel=1
pkgdesc="Rancher Kubernetes Engine, an extremely simple, lightning fast Kubernetes installer that works everywhere."
arch=('x86_64' 'aarch64' 'arm' 'armv6h' 'armv7h')
url='https://github.com/rancher/rke'
license=('Apache')
provides=('rke')
conflicts=('rke')
_rke_file=rke-$_pkgver

case "${CARCH}" in
  x86_64)    _CARCH=amd64 && sha256sums=('dbc3a659c333b1dcd54721b065156b46241e87724592e6c1db4c5d1ea05bc606');;
  arm*)      _CARCH=arm   && sha256sums=('8d788db5ca511fd6ef9692a74ff2f0881e2dfd491e87885ca4c9559d1aed7aec');;
  aarch64)   _CARCH=arm64 && sha256sums=('872282760ce4eb65ad73ca603e4349105b8b54e6db4e7252df54f3f8312bd22f');;
esac

source=($_rke_file::"https://github.com/rancher/rke/releases/download/${_pkgver}/rke_linux-${_CARCH}")

package() {
    install -Dm 755 "$srcdir/$_rke_file" "${pkgdir}/usr/bin/rke"
}
