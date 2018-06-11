# Maintainer: Akkenoth <akkenoth+aur [at] google [dot] com>
pkgname=log4cxx-git
_pkgname=log4cxx
pkgver=20180321
pkgrel=1
pkgdesc="A C++ port of Log4j, development version (GIT)"
url="http://logging.apache.org/log4cxx"
license=("Apache")
groups=()
depends=('apr-util' 'libxml2')
arch=('i686' 'x86_64')
makedepends=('git' 'zip')
provides=('log4cxx')
conflicts=('log4cxx')
options=()
install=
source=("${_pkgname}::git+https://git-wip-us.apache.org/repos/asf/logging-log4cxx.git#commit=5f825186936a1876f92b88b371334ff26e997287")
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
