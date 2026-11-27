# Maintainer: Stephan Springer <buzo+arch@Lini.de>
# Contributor: Kewl <xrjy@nygb.rh.bet(rot13)>
# Contributor: Luca P <meti at lplab.net>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Jeffrey 'jf' Lim <jfs.world@gmail.com>

pkgname=tnef
pkgdesc="Program for unpacking ms-tnef MIME attachment"
pkgver=1.5.0
pkgrel=1
arch=('x86_64')
url="https://github.com/verdammelt/tnef"
license=('GPL')
makedepends=('glibc')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=('f148885bf3282845fe110575cc8dbb73983ed83c07b40a44bf5a8ac629b14378')

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
