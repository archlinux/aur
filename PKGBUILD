# Maintainer: Thomas Weißschuh <thomas_weissschuh@lavabit.com>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=batman-adv
pkgver=2012.1.0
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
sha1sums=('e0a320c1f90396edf61f4da7d911c3d2d6f75e66'
          '53cebfa79c3a6c659ea5f7ea96c86561c7cd6a3b')
