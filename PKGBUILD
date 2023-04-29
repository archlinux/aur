# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: wubbl0rz <wubbl0rz at gmx.de>
pkgname=vmchamp-bin
pkgver=v0.0.7
pkgrel=1
pkgdesc="Simple and fast creation of throwaway VMs on your local machine."
arch=('x86_64')
url="https://github.com/wubbl0rz/VmChamp"
license=('unknown')
depends=('zlib' 'libvirt')
source=("VmChamp-linux-$pkgver-amd64::https://github.com/wubbl0rz/VmChamp/releases/download/$pkgver/VmChamp-linux-$pkgver-amd64")
sha256sums=('SKIP')

package() {
  mv VmChamp-linux-$pkgver-amd64 VmChamp
  install -d -m0755 -g 0 "${pkgdir}"/usr/bin
  install -m0755 -g 0 -t "${pkgdir}"/usr/bin/ VmChamp
  ln -s VmChamp ${pkgdir}/usr/bin/vmchamp
}
