# overall information
pkgname=akku
pkgdesc='Language package manager for Scheme'
url='https://akkuscm.org/'
license=('GPL3')
arch=('any')

# version-specific information
pkgver=1.1.0
pkgrel=5

# dependencies are stated in https://gitlab.com/akkuscm/akku/-/blob/master/README.md
depends=('git' 'curl' 'guile>=2.2')
makedepends=('pkg-config' 'make')

# source URLs for latest versions can be found at https://gitlab.com/akkuscm/akku/-/releases
source=('https://gitlab.com/akkuscm/akku/uploads/819fd1f988c6af5e7df0dfa70aa3d3fe/akku-1.1.0.tar.gz')
sha256sums=('12decdc8a2caba0f67dfcd57b65e4643037757e86da576408d41a5c487552c08')
options=(!strip)

build() {
	cd "$pkgname-$pkgver"
	./configure --prefix=/usr
	make
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}
