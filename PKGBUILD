# Maintainer: r6eve <r6eve at acm dot org>

pkgname=cntr-bin
pkgver=1.5.1
pkgrel=2
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
sha256sums=('63e172c49c64d97fd353e9517a5285ad75589b28d8e56f8bd58eaf19de395a29')

package() {
  mv "${pkgname}-${pkgver}" "${pkgname%-bin}"
  install -Dm0755 -t "${pkgdir}/usr/bin/" "${pkgname%-bin}"
}
