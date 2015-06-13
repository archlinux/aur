# Maintainer: Marco Pompili <marcs.pompili@gmail.com>
# Contributor: Dennis Kempin <mail@dennis-kempin.de>

pkgname=boost-build
pkgver=2014.10
ver=2014-10
pkgrel=1
pkgdesc="Boost.Build makes it easy to build C++ projects, everywhere."
arch=('any')
url="http://www.boost.org/build/"
license=('custom:boost')
depends=('boost' 'gcc' 'python')
source=("https://github.com/boostorg/build/releases/download/${pkgver}/${pkgname}-${ver}.tar.bz2"
        "http://www.boost.org/LICENSE_1_0.txt")

package() {
  cd ${srcdir}

  mkdir -p ${pkgdir}/usr/share
  mkdir -p ${pkgdir}/etc

  rm -Rf ${pkgname}/jam_src
  rm -Rf ${pkgname}/debian

  cp -R ${pkgname} ${pkgdir}/usr/share
  install -Dm644 LICENSE_1_0.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  echo "using gcc ;" > ${pkgdir}/etc/site-config.jam
}

md5sums=('76431f8fba21d2ea83d185bec7c93d81'
         'e4224ccaecb14d942c71d31bef20d78c')
