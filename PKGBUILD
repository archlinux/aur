# Maintainer: Thomas Weißschuh <thomas_weissschuh@lavabit.com>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=batman-adv
pkgver=2012.2.0
pkgrel=1
pkgdesc="batman kernel module, (included upstream since .38)"
arch=('i686' 'x86_64')
url="http://www.open-mesh.net/"
license=('GPL')
install='batman-adv.install'
source=("http://downloads.open-mesh.org/batman/releases/${pkgname}-${pkgver}/${pkgname}-${pkgver}.tar.gz"
        "batman-adv.install")
depends=("linux")
makedepends=("linux-headers")

build() {
  cd "${srcdir}"/${pkgname}-${pkgver}
  make
}

package() {
  cd "${srcdir}"/${pkgname}-${pkgver}
  install -D -m644 batman-adv.ko ${pkgdir}/lib/modules/$(uname -r)/updates/net/batman-adv/batman_adv.ko
  install -D -m644 README ${pkgdir}/usr/share/doc/batman-adv/README
}
md5sums=('68967ed1df709de18ab795722dde9341'
         'c5dd80d2a89da0a4f77b858c0815f400')
