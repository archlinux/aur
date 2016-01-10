# Maintainer: Marco Pompili <marcs.pompili@gmail.com>
# Contributor: Dennis Kempin <mail@dennis-kempin.de>

pkgname=boost-build
pkgver=1.60
pkgrel=1
pkgdesc="Boost.Build makes it easy to build C++ projects, everywhere."
arch=('any')
url="http://www.boost.org/build/"
license=('custom:boost')
depends=('boost' 'gcc' 'python')
source=("https://github.com/boostorg/build/archive/boost-${pkgver}.0.tar.gz"
        "http://www.boost.org/LICENSE_1_0.txt")
md5sums=('987767d1e22e34e5b90e54ff6b526f40'
         'e4224ccaecb14d942c71d31bef20d78c')

prepare() {
  cd ${srcdir}/build-boost-${pkgver}.0/

  ./bootstrap.sh
}

package() {
  cd ${srcdir}/build-boost-${pkgver}.0/

  echo ${pkgdir}

  ./b2 install --prefix=${pkgdir}/usr

  install -Dm644 ${srcdir}/LICENSE_1_0.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
