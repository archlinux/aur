# Maintainer: r6eve <r6eve at acm dot org>

pkgname=cntr-bin
pkgver=2.1.0
pkgrel=1
pkgdesc='A container debugging tool based on FUSE'
arch=('x86_64')
url='https://github.com/Mic92/cntr'
license=('MIT')
optdepends=('docker: docker support'
  'podman: podman support'
  'lxc: LXC support'
  'lxd: LXD support'
  'systemd: systemd-nspawn support'
  'containerd: containerd support')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
noextract=("${pkgname}-${pkgver}")
options=('!debug')
source=("${pkgname}-${pkgver}"::"${url}/releases/download/${pkgver}/${pkgname}-${pkgver}-${CARCH}-unknown-linux-musl")
sha256sums=('3d00cb98c9f8f7f6f86bdaa07ba2a246ca3f638d63edb002e9286968c7024b78')

package() {
  mv "${pkgname}-${pkgver}" "${pkgname%-bin}"
  install -Dm0755 -t "${pkgdir}/usr/bin/" "${pkgname%-bin}"
}
