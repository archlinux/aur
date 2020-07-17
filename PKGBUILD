# Maintainer: Victor <victor@xirion.net>

pkgname=rke-bin
pkgver=1.1.4
_pkgver=v$pkgver
pkgrel=1
pkgdesc='Rancher Kubernetes Engine, an extremely simple, lightning fast Kubernetes installer that works everywhere.'
arch=('x86_64' 'aarch64' 'arm' 'armv6h' 'armv7h')
url='https://github.com/rancher/rke'
license=('Apache')
provides=('rke')
_rke_file=rke-$_pkgver

case "${CARCH}" in
  x86_64)    _CARCH=amd64 && sha256sums=('1c7bb6e7eb3c820475b3ecbc4fc5786a912658b9d0e1f4323759c1bb72d6a758');;
  aarch64)   _CARCH=arm64 && sha256sums=('2fc1eaf0475b59b1144493e762052fd7fa310c2c0196cb3783cf7fc519d3c888');;
  arm*)      _CARCH=arm   && sha256sums=('011f6bad2ce19c417cfdd96d56befd488671484eafdb9b90cd3c28eedc66b45a');;
esac

source=($_rke_file::"https://github.com/rancher/rke/releases/download/${_pkgver}/rke_linux-${_CARCH}")

package() {
    install -Dm 755 "$srcdir/$_rke_file" "${pkgdir}/usr/bin/rke"
}
