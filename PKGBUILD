#Maintainer: Marco Pompili <aur@emarcs.org>

pkgname=pkcrack
pkgver=1.2.2
pkgrel=2
pkgdesc="An algorithm for breaking the PkZip cipher that was devised by Eli Biham and Paul Kocher."
arch=('i686' 'x86_64')
url="https://www.unix-ag.uni-kl.de/~conrad/krypto/pkcrack.html"
license=('custom')
depends=('glibc')
source=("https://www.unix-ag.uni-kl.de/~conrad/krypto/pkcrack/pkcrack-${pkgver}.tar.gz")
sha256sums=('4d2dc193ffa4342ac2ed3a6311fdf770ae6a0771226b3ef453dca8d03e43895a')

build() {
  cd ${pkgname}-${pkgver}/src
  make
}

package() {
  cd ${pkgname}-${pkgver}/src
  install -Dm755 extract ${pkgdir}/usr/bin/extract
  install -Dm755 findkey ${pkgdir}/usr/bin/findkey
  install -Dm755 makekey ${pkgdir}/usr/bin/makekey
  install -Dm755 pkcrack ${pkgdir}/usr/bin/pkcrack
  install -Dm755 zipdecrypt ${pkgdir}/usr/bin/zipdecrypt
}
