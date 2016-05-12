# Maintainer: Akkenoth <akkenoth+aur [at] google [dot] com>
pkgname=log4cxx-svn
_pkgname=log4cxx
pkgver=464
pkgrel=1
pkgdesc="A C++ port of Log4j, SVN trunk version"
url="http://logging.apache.org/log4cxx"
license=("Apache")
groups=()
depends=('apr-util' 'libxml2')
arch=('i686' 'x86_64')
makedepends=('svn' 'autoconf' 'automake' 'libtool' 'patch' 'zip' 'gzip' 'sed')
provides=('log4cxx')
conflicts=('log4cxx')
options=()
install=
source=("${_pkgname}::svn+http://svn.apache.org/repos/asf/incubator/log4cxx/trunk@1737849")
md5sums=(SKIP)

build() {
  cd "${srcdir}/${_pkgname}"
  ./autogen.sh
  ./configure --prefix=/usr --disable-static
  make
}

package() {
  cd "${srcdir}/${_pkgname}"
  make DESTDIR="${pkgdir}/" install
}
