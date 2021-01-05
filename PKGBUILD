# Maintainer: David Wang <tuxsavvy-noms at yahoo dot com dot au>
pkgname=ebu
pkgver=4.5
pkgrel=20200413
pkgdesc="EB library (EPWING) with JIS X 4081 UTF-8 support"
arch=('any')
url="http://green.ribbon.to/~ikazuhiro/dic/ebu.html"
license=('BSD')
makedepends=('autoconf' 'automake')
depends=('perl' 'gcc-libs' 'zlib' 'libnsl' 'libiconv')
options=('!libtool')
source=("http://green.ribbon.to/~ikazuhiro/dic/files/${pkgname}-${pkgver}-${pkgrel}.tar.gz")
sha512sums=('ec72aac8eb660d155660fdd612076df03c68c735cb584df48718542363a1a87baa076510dae71918287e88c2af68362ec06aec9b05b063e9f6519576c597e453')

build() {
  cd "$srcdir/${pkgname}-${pkgver}-${pkgrel}"
  ./configure --prefix=/usr --sysconfdir=/etc
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}-${pkgrel}"
  make DESTDIR="${pkgdir}" install
  install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}

# vim:set ts=2 sw=2 et:
