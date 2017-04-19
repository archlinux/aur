# Maintainer: Chris Hobbs (RX14) <chris@rx14.co.uk>
pkgname=infinitsh
pkgver=0.7.3
pkgrel=1
pkgdesc="Decentralized Software-Based File Storage Platform"
arch=('x86_64')
url="http://infinit.sh"
license=('unknown')
depends=('fuse')
source=("https://storage.googleapis.com/sh_infinit_releases/linux64/Infinit-x86_64-linux_debian_oldstable-gcc4-${pkgver}.tbz")
sha256sums=('580a8257ef44210bd5beef640c39515205299a73bae12a3b618b3e184c67d81c')

package() {
	  cd "Infinit-x86_64-linux_debian_oldstable-gcc4-${pkgver}/"
    mkdir -p $pkgdir/opt/infinit.sh/
    cp -a * $pkgdir/opt/infinit.sh/
    cd $pkgdir/opt/infinit.sh/bin/
    mkdir -p $pkgdir/usr/bin
    for file in *; do ln -s /opt/infinit.sh/bin/$file $pkgdir/usr/bin/$file; done
}
