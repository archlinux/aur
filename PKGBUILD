# Maintainer: M0Rf30

pkgname=simonpi-git
pkgver=57.ab2dd2e
pkgrel=1
epoch=
pkgdesc="A quick & dirty script to emulate Raspberry PI family devices on your laptop"
arch=(any)
url="https://github.com/M0Rf30/simonpi"
license=('GPL')
depends=('bridge-utils' 'coreutils' 'dosfstools' 'libarchive' 'dnsmasq' 'e2fsprogs' 'util-linux' 'iproute2' 'iptables' 'qemu-arch-extra' 'wget')
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
	install -Dm755 simonpiemu/runemu $pkgdir/opt/simonpi/runemu
        install -Dm755 simonpiemu/runemu $pkgdir/opt/simonpi/runemu   
	sed -i "s/OPT=/OPT=opt/g" $pkgdir/usr/bin/simonpi
}

md5sums=('SKIP')
