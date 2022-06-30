# Maintainer: Victor <victor@xirion.net>

pkgname=rke-bin
pkgver=1.3.12
pkgrel=1
pkgdesc="Rancher Kubernetes Engine, an extremely simple, lightning fast Kubernetes installer that works everywhere."
arch=('x86_64' 'aarch64' 'arm' 'armv6h' 'armv7h')
url='https://github.com/rancher/rke'
license=('Apache')
provides=('rke')
conflicts=('rke')

case "${CARCH}" in
  x86_64)  _CARCH=amd64 && sha256sums=('579da2206aec09cadccd8d6f4818861e78a256b6ae550a229335e500a472bd50');;
  arm*)    _CARCH=arm   && sha256sums=('e21da6e880a5d1ebb21a624f50111ef364774e2603c343153c01810128bf6fdf');;
  aarch64) _CARCH=arm64 && sha256sums=('e7fba501d623cb600766c9f9851b386a4f6986e3034dc44a724213fd9911b125');;
esac

source=("rke-${pkgver}-${pkgrel}"::"https://github.com/rancher/rke/releases/download/v${pkgver}/rke_linux-${_CARCH}")

package() {
  install -Dm 755 "${srcdir}/rke-${pkgver}-${pkgrel}" "${pkgdir}/usr/bin/rke"
}
