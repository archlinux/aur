# Maintainer: r6eve <r6eve at acm dot org>

pkgname=cntr-bin
pkgver=1.6.0
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
source=("${pkgname}-${pkgver}"::"${url}/releases/download/${pkgver}/${pkgname}-${pkgver}-${CARCH}-unknown-linux-musl")
noextract=("${pkgname}-${pkgver}")
sha256sums=('731393d1e9e7c550d6784d6e11844779091b1b8d46f35b4698bbd520d1bf7f93')

package() {
  mv "${pkgname}-${pkgver}" "${pkgname%-bin}"
  install -Dm0755 -t "${pkgdir}/usr/bin/" "${pkgname%-bin}"
}
