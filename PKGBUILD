# Maintainer: Stephan Springer <buzo+arch@Lini.de>
# Contributor: Kewl <xrjy@nygb.rh.bet(rot13)>
# Contributor: Luca P <meti at lplab.net>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Jeffrey 'jf' Lim <jfs.world@gmail.com>

pkgname=tnef
pkgdesc="Program for unpacking ms-tnef MIME attachment"
pkgver=1.4.18
pkgrel=3
arch=('x86_64')
url="https://github.com/verdammelt/tnef"
license=('GPL')
makedepends=('glibc')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=('fa56dd08649f51b173017911cae277dc4b2c98211721c2a60708bf1d28839922')

prepare() {
    cd "${pkgname}-${pkgver}"
    autoreconf -fi
}

build() {
    cd "$pkgname-$pkgver"
    CFLAGS="$CFLAGS -std=gnu17"
    ./configure --prefix=/usr
    make  
}

package() {
  cd "${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}/" install
}
