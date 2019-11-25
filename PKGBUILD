# Maintainer: Moses Narrow <moe_narrow@use.startmail.com>
pkgname=portergos
pkgname1=portergos
pkgdesc="the portergos ISO installer & system cloner utility"
pkgver=201808
pkgrel=1
arch=('x86_64')
url="https://github.com/Portergos/Fork-Portergos-iso-64bits"
license=()
makedepends=()
depends=(dialog ncurses)
source=("portergos.tar.gz")
sha256sums=('acf917d009b42ae72165462aa1d067f3113a105634eabea438446d36bf43db57')

package() {
mkdir -p ${pkgdir}/usr/lib/
mkdir -p ${pkgdir}/usr/bin
bsdtar -xpf ../portergos.tar.gz -C ${pkgdir}/usr/lib/
ln -rTsf ${pkgdir}/usr/lib/portergos/installer ${pkgdir}/usr/bin/portergos
ln -rTsf ${pkgdir}/usr/lib/portergos/installer_test ${pkgdir}/usr/bin/portergos-test
ln -rTsf ${pkgdir}/usr/lib/portergos ${pkgdir}/portergos
	#chmod 755 ${pkgdir}/usr/bin/*
}
