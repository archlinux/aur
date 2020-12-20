# Maintainer: Score_Under <seejay.11@gmail.com>
# Contributor: Gavin Lloyd <gavinhungry@gmail.com>
# Contributor: Pablo Lezaeta <prflr88@gmail.com>
# Contributor: BlackLotus89 <maxmusterm@gmail.com>

pkgname=toybox
pkgver=0.8.4
pkgrel=1
pkgdesc='All-in-one Linux command line'
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url='https://landley.net/toybox'
license=('BSD')
depends=('attr')
source=("https://github.com/landley/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('bea9fe3aae662ef97b7450df8c0333e50c69cd9f626be8f7e245ef322605b1e9')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  make defconfig
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  PREFIX="${pkgdir}/usr/${pkgname}" make install
  install -Dm755 "$pkgname" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
