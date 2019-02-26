# Maintainer: alienzj <alienchuj@gmail.com>

_basename="seqan3"
pkgname=${_basename}-git
pkgver=r628.35e4fba
pkgrel=1
pkgdesc="The modern C++ library for sequence analysis"
arch=('i686' 'x86_64')
url="http://www.seqan.de"
license=('custom')
#depends=('gcc-libs' 'coin-or-lemon' 'range-v3' 'sdsl-lite-v3-git')
optdepends=('bzip2: bzip2 support'
            'zip: zip support'
            'coin-or-lemon: graphs, required for MSA'
            'cereal: serialisation support')
makedepends=('cmake' 'gcc' 'make' 'doxygen' 'gtest' 'benchmark')
provides=(${_basename}=${pkgver})
conflicts=(${_basename})
source=("git://github.com/seqan/seqan3.git")
md5sums=('SKIP')

prepare() {
  cd "${srcdir}/${_basename}"
  echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

package() {
  cd "${srcdir}/${_basename}"
  # install -D -m644 "${srcdir}/${_basename}/include/${_basename}" \
    #         "$pkgdir/usr/include/${_basename}"
  mkdir -p "$pkgdir/usr/include"
  cp -rf "${srcdir}/${_basename}/include/${_basename}" \
     "$pkgdir/usr/include/${_basename}"
}
