# Maintainer: r6eve <r6eve at acm dot org>

pkgname=cntr-bin
pkgver=1.6.1
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
sha256sums=('2250a2bbedbb0de1790e879e37402593280c1d04af81dc9c5c88004484bdf1c7')

package() {
  mv "${pkgname}-${pkgver}" "${pkgname%-bin}"
  install -Dm0755 -t "${pkgdir}/usr/bin/" "${pkgname%-bin}"
}
