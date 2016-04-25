# Maintainer: Miguel Revilla <yo@miguelrevilla.com>
# Contributor: Darwin Bautista <djclue917@gmail.com>

pkgname=amrwb
pkgver=11.0.0.0
pkgrel=3
pkgdesc="3GPP AMR Adaptive Multi-Rate - Wideband (AMR-WB) Speech Codec"
arch=('i686' 'x86_64')
url="http://www.penguin.cz/~utx/amr"
license=('custom')
depends=('glibc')
makedepends=('wget')
options=('!libtool')
source=(ftp://ftp.penguin.cz/pub/users/utx/amr/${pkgname}-${pkgver}.tar.bz2)
md5sums=('f9ea63e6f8b778fe1040f73891ba3720')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  ./configure --prefix=/usr

  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  make DESTDIR="${pkgdir}"/ install
  install -Dm644 COPYING "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE

}
