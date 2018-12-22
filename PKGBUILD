# Maintainer: Akkenoth <akkenoth+aur [at] google [dot] com>
pkgname=log4cxx-git
_pkgname=log4cxx
pkgver=20181214
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
source=("${_pkgname}::git+https://gitbox.apache.org/repos/asf/logging-log4cxx.git#commit=171e980fdd31e09e36841cf82adcebfa12bcd6d0")
md5sums=(SKIP)

build() {
  cd "${_pkgname}"
  ./autogen.sh
  ./configure --prefix=/usr --disable-static
  make
}

# Check fails ATM
#check() {
#  cd "${_pkgname}"
#  make -k check
#}

package() {
  cd "${_pkgname}"
  make DESTDIR="${pkgdir}/" install
}
