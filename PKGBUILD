# Maintainer: Victor <victor@xirion.net>

pkgname=rke-bin
pkgver=1.2.5
_pkgver=v$pkgver
pkgrel=1
pkgdesc='Rancher Kubernetes Engine, an extremely simple, lightning fast Kubernetes installer that works everywhere.'
arch=('x86_64' 'aarch64' 'arm' 'armv6h' 'armv7h')
url='https://github.com/rancher/rke'
license=('Apache')
provides=('rke')
conflicts=('rke')
_rke_file=rke-$_pkgver

case "${CARCH}" in
  x86_64)    _CARCH=amd64 && sha256sums=('77d2dc6af0d9388cba7dddea9ce3339d8e99618a32da68d043018ef63840bc6f');;
  aarch64)   _CARCH=arm64 && sha256sums=('f8c98d85cd72a50b9232067634b95df16848e7869499cea32f109a1a017df1e7');;
  arm*)      _CARCH=arm   && sha256sums=('0acc3b797b5adb44ccf3474755db510dafb73c6678ef403955f1bb9fa2ee3899');;
esac

source=($_rke_file::"https://github.com/rancher/rke/releases/download/${_pkgver}/rke_linux-${_CARCH}")

package() {
    install -Dm 755 "$srcdir/$_rke_file" "${pkgdir}/usr/bin/rke"
}
