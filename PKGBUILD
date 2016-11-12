#Maintainer: Christian Rebischke <echo Q2hyaXMuUmViaXNjaGtlQGdtYWlsLmNvbQo= | base64 -d>

pkgname=viper-framework
pkgver=1.2
pkgrel=3
pkgdesc="Stable version of Viper the Binary Analysis Framework"
arch=("any")
url="https://github.com/botherder/viper"
license=("BSD")
depends=(
"python2-pyexiftool" "python2-pylzma" "python2-bottle" "python2-pyelftools" 
"python2-bitstring" "python2-dnspython" "python2-m2crypto" "python2-pyasn1" 
"python2-requests" "python2-sqlalchemy" "python2-prettytable" "python2-magic" 
"python2-pydeep" "ssdeep" "python2-ssdeep" "python2-beautifulsoup4" 
"python2-pefile" "python2-crypto" "python2-olefile" "python2-oletools") 
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/botherder/viper/archive/v${pkgver}.tar.gz")
sha512sums=("07ed69479a472a9c909ea57661af33fc8f5a50df4e3af627658dea26d1e5e7f0fef5baef783a4042506e4eb702e757dea8da8e7fd3002d0ae77c053d9f74aee2")
install="viper-framework.install"

build() {
  cd "viper-${pkgver}"
  python2 -m compileall .
  python2 -O -m compileall .
}

package() {
  cd "${srcdir}/viper-${pkgver}"
  mkdir -p "${pkgdir}/opt/viper/"
  mv * "${pkgdir}/opt/viper/"
}
