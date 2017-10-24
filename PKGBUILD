# Maintainer: M0Rf30

pkgname=simonpi-git
pkgver=3.74d3d26
pkgrel=1
epoch=
pkgdesc="A quick & dirty script to emulate Raspberry PI family devices on your laptop"
arch=(any)
url="https://github.com/M0Rf30/simonpi"
license=('GPL')
depends=('bridge-utils' 'coreutils' 'dnsmasq' 'dosfstools' 'e2fsprogs' 'iproute2' 'iptables' 'libarchive' 'qemu-arch-extra' 'sudo' 'util-linux' 'wget')
makedepends=('git')
install=
source=("simonpi::git+https://github.com/M0Rf30/simonpi.git")

pkgver() {
  cd $srcdir/simonpi
  echo $(git rev-list --count master).$(git rev-parse --short master)
}

package() {
	cd $srcdir/simonpi
	install -Dm755 simonpi $pkgdir/usr/bin/simonpi
	install -Dm755 simonpiemu/runemu $pkgdir/opt/simonpiemu/runemu
        install -Dm755 simonpiemu/qemu-kernel-simonpi $pkgdir/opt/simonpiemu/qemu-kernel-simonpi 
	sed -i "s/OPT=./OPT=\/opt/g" $pkgdir/usr/bin/simonpi
}

md5sums=('SKIP')
