# Maintainer: Victor <victor@xirion.net>

pkgname=rke-bin
pkgver=1.2.0
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
  x86_64)    _CARCH=amd64 && sha256sums=('d87641e1b8c253e9dd1d8156f44a0892843916a88b01a9840ea8a6329ea3594e');;
  aarch64)   _CARCH=arm64 && sha256sums=('96f4e1a4f11882259d0fb63eadece9be4c485d894e08860380eb6bb7760185e4');;
  arm*)      _CARCH=arm   && sha256sums=('d61c50eedad8184630b4b55bf1b65e0f65fbd00e97a4b526fcb902625bb7be16');;
esac

source=($_rke_file::"https://github.com/rancher/rke/releases/download/${_pkgver}/rke_linux-${_CARCH}")

package() {
    install -Dm 755 "$srcdir/$_rke_file" "${pkgdir}/usr/bin/rke"
}
