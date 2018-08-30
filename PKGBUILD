# Maintainer: alienzj <alienchuj@gmail.com>

_basename="seqan3"
pkgname=${_basename}-git
pkgver=3.0.r628.35e4fba
pkgrel=1
pkgdesc="The modern C++ library for sequence analysis"
arch=('i686' 'x86_64')
url="http://www.seqan.de"
license=('custom')
depends=('bash' 'bzip2' 'zlib')
makedepends=('cmake')
provides=(${_basename}=${pkgver})
conflicts=(${_basename})
source=("git://github.com/seqan/seqan3.git")
md5sums=('SKIP')

prepare() {
  cd "${srcdir}/${_basename}"
  echo "3.0.r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

package() {
  cd "${srcdir}/${_basename}"
  mkdir -p "${pkgdir}/usr/include/${_basename}"
  cp -rf include/seqan3 "$pkgdir/usr/include/${_basename}"
}
