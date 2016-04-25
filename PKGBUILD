# Maintainer: Miguel Revilla <yo@miguelrevilla.com>
# Contributor: Darwin Bautista <djclue917@gmail.com>

pkgname=amrnb
pkgver=11.0.0.0
pkgrel=3
pkgdesc="3GPP Adaptive Multi-Rate Floating-point (AMR) Speech Codec"
arch=('i686' 'x86_64')
url="http://www.penguin.cz/~utx/amr"
license=('custom')
depends=('glibc')
makedepends=('wget')
options=('!libtool')
source=(ftp://ftp.penguin.cz/pub/users/utx/amr/${pkgname}-${pkgver}.tar.bz2)
md5sums=('673ab645f61d1c830b6429a5ba76bb1f')

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
