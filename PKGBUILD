# Maintainer: leha2000 <leha2000[at]list[dot]ru>
pkgname=xsnap
pkgver=1.5.8
pkgrel=1
pkgdesc="Simple program for screenshot making with window select area and saving his in many formats :)"
url="http://freecode.com/projects/xsnap"
arch=('x86_64' 'i686')
license=('GPLv3')
depends=('imake')
optdepends=('xproto')
makedepends=()
conflicts=()
replaces=()
backup=()
#install='foo.install'
source=("ftp://ftp.ac-grenoble.fr/ge/Xutils/xsnap-1.5.8.tar.bz2")
md5sums=('5a27d5af93893ec8ce2fc80a662c1736')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  xmkmf
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
  make DESTDIR="${pkgdir}" install.man
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}

