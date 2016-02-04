pkgname=libvmime-git
pkgver=1
pkgrel=1
pkgdesc="A C++ class library for working with MIME messages"
arch=('x86_64' 'i686')
url="http://www.vmime.org/"
license=('GPL')
depends=('gsasl' 
	 'gnutls')
makedepends=('cmake')
source=("git://github.com/kisli/vmime")
conflicts=('zarafa-libvmime')
replaces=('zarafa-libvmime')
md5sums=('SKIP')

prepare() {
  mkdir build
}

build() {
  cd build

  cmake ../vmime \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DLIB_INSTALL_DIR=/usr/lib/ \
    -DCMAKE_BUILD_TYPE=Release

  make
}

package() {
  cd 'build'

  make DESTDIR="$pkgdir" install
}
