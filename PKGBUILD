# Maintainer: Eric Bélanger <eric@archlinux.org>

pkgname=di
pkgver=4.47
pkgrel=1
pkgdesc="A disk information utility, displaying everything (and more) that your df command does"
arch=('x86_64')
url="http://www.gentoo.com/di/"
license=('ZLIB')
depends=('glibc')
source=(http://gentoo.com/di/${pkgname}-${pkgver}.tar.gz)
sha256sums=('b5031c1f3b98536eee95fb91634fe700cec5e08a3cf38e14fffc47f969bf8a7e')

build() {
  cd ${pkgname}-${pkgver}
  make
}

package() {
  cd ${pkgname}-${pkgver}
  make INSTALL_DIR="${pkgdir}/usr" install
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
