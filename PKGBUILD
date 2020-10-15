# Maintainer: tinywrkb <tinywrkb@gmail.com>
# Contributor: Vincent gatine <nurelin15@gmail.com>

pkgname=genext2fs
pkgver=1.5.0
pkgrel=1
pkgdesc="ext2 filesystem generator for embedded systems"
arch=(i686 x86_64)
url="http://genext2fs.sourceforge.net"
license=('GPL2')
depends=('glibc')
makedepends=()
source=("https://github.com/bestouff/genext2fs/archive/v${pkgver}.tar.gz")
sha256sums=('d3861e4fe89131bd21fbd25cf0b683b727b5c030c4c336fadcd738ada830aab0')

build() {
  cd ${pkgname}-${pkgver}
  ./autogen.sh
  ./configure --prefix=/usr \
  make
}

check() {
  cd ${pkgname}-${pkgver}
  make check
}

package() {
  cd ${pkgname}-${pkgver}

  make DESTDIR=${pkgdir} install
  install -D -m644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim: ts=2 sw=2 et
