# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Your Name <youremail@domain.com>
pkgname=infinitsh
pkgver=0.6.0
pkgrel=1
pkgdesc="Decentralized Software-Based File Storage Platform"
arch=('x86_64')
url="http://infinit.sh"
license=('GPL')
depends=('fuse')
source=("https://storage.googleapis.com/sh_infinit_releases/linux64/Infinit-x86_64-linux_debian_oldstable-gcc4-${pkgver}.tbz")
md5sums=('35a33301f78643b5a75bc00aaccd7dc6')

package() {
    find
	cd "Infinit-x86_64-linux_debian_oldstable-gcc4-${pkgver}/"
    mkdir -p $pkgdir/opt/infinit.sh/
    cp -a * $pkgdir/opt/infinit.sh/
    cd $pkgdir/opt/infinit.sh/bin/
    mkdir -p $pkgdir/usr/bin
    for file in *; do ln -s /opt/infinit.sh/bin/$file $pkgdir/usr/bin/$file; done
}
