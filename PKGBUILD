# Maintainer: Arthus Belliqueux  <contact at arthus dot net>
# Contributor: Vinicius Correa <vinicius dot correa at zoho dot com>
pkgname=gendev
pkgver=0.7.1
pkgrel=1
pkgdesc="Genesis development environment for Linux"
arch=('any')
url="https://github.com/kubilus1/${pkgname}"
license=('BSD')
depends=('texinfo' 'jdk8-openjdk' 'llvm-libs')
options=(!strip)
makedepends=()
optdepends=()
source=("https://github.com/kubilus1/gendev/releases/download/${pkgver}/${pkgname}_${pkgver}.txz" "liblto.patch")
md5sums=('08f79f377570871899472ef4503382d3'
         '68a2b31d51b80cb009b10443f527c2ba')

prepare() {
    patch --binary --strip=1 --input=liblto.patch
}

package() {
  install -dm755 "${pkgdir}/opt"
  cp -r "${srcdir}/opt/${pkgname}" "${pkgdir}/opt/${pkgname}"
}
