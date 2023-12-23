# Maintainer: r6eve <r6eve at acm dot org>

pkgname=cntr-bin
pkgver=1.5.3
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
sha256sums=('25fe7231b835fbed62be17a847ff04c54da9a9e8d0691ffe492650be023a64fa')

package() {
  mv "${pkgname}-${pkgver}" "${pkgname%-bin}"
  install -Dm0755 -t "${pkgdir}/usr/bin/" "${pkgname%-bin}"
}
