# Maintainer: Grey Christoforo <my first name [at] my last name [dot] net>

pkgname=protobuf-ultimaker
pkgver=15.06.03
pkgrel=1
pkgdesc="Protocol Buffers - Google's data interchange format (with modifications by Ultimaker)"
depends=('gcc-libs' 'zlib' 'python-setuptools' 'python2-setuptools' 'unzip')
provides=('protobuf3')
conflicts=('protobuf3')
url="https://github.com/Ultimaker/protobuf"
license=('custom')
arch=('i686' 'x86_64')
source=(https://github.com/Ultimaker/protobuf/archive/${pkgver}.tar.gz)
sha1sums=('09c8f014e47bf451cea548ddba72524a42c05991')

build(){
  cd protobuf-${pkgver}
  ./autogen.sh
  ./configure --prefix=/usr
  make
}

check(){
  cd protobuf-${pkgver}
  make check
}

package(){
  cd protobuf-${pkgver}
  make DESTDIR="$pkgdir" install
}

