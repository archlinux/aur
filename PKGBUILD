# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: j.r <j.r@jugendhacker.de>
pkgname=xmppc
pkgver=0.0.3_1
pkgrel=1
pkgdesc="Command Line Interface Tool for XMPP"
arch=('x86_64' 'i686')
url="https://codeberg.org/Anoxinon_e.V./xmppc"
license=('GPL3')
depends=('glibc' 'glib2' 'libstrophe' 'gpgme')
makedepends=()
# source=("${url}/archive/$pkgver.tar.gz")
# Broken for current release
source=("${url}/archive/0.0.3-1.tar.gz")

build() {
	cd "$pkgname"
	./bootstrap.sh
	./configure --prefix=/usr
	make
}

package() {
	cd "$pkgname"
	make DESTDIR="$pkgdir/" install
}
md5sums=('5ab6a3e5c1ee95b618d1632cb67b60a5')
