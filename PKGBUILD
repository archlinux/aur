# Maintainer: Daniel Nagy <danielnagy at gmx de>
# Contributor: Tom Vincent <http://tlvince.com/contact/>

pkgname=eclipse-ivyde
pkgver=2.2.0.final
_pkgver=${pkgver}-201311091524-RELEASE
pkgrel=1
pkgdesc="Eclipse plugin which integrates Apache Ivy's dependency management"
url="https://ant.apache.org/ivy/ivyde/"
arch=('any')
license=('apache')
depends=('eclipse' 'eclipse-ivyde-ivy')
source=("http://mirrors.ukfast.co.uk/sites/ftp.apache.org/ant/ivyde/${pkgver}/apache-ivyde-${_pkgver}.tar.gz")
md5sums=('7bed9c2bcf920e7e29735f62a78495c3')

package() {
  local dest=${pkgdir}/usr/share/eclipse/dropins/${pkgname/eclipse-}/eclipse
  mkdir -p $dest
  tar --directory $dest --strip-components=1 --wildcards -xzvf ${srcdir}/apache-ivyde-${_pkgver}.tar.gz "*.jar"
}
