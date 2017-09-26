# Maintainer:  TC <crt@archlinux.email>
# Contributor: Sébastien Duquette <ekse.0x@gmail.com>
# Contributor: damir <damir@archlinux.org>
# Contributor: Damir Perisa <damir.perisa@bluewin.ch>

pkgname=lft
pkgver=3.79
pkgrel=1
pkgdesc="A layer four traceroute implementing numerous other features"
arch=('i686' 'x86_64')
license=('custom')
url="http://pwhois.org/lft/"
depends=('libpcap')
source=("http://pwhois.org/dl/index.who?file=${pkgname}-${pkgver}.tar.gz")
md5sums=('746dc08f2e20d0e0240f28873b3bb244')

build() {
  cd "${srcdir}/$pkgname-$pkgver"
  ./configure --prefix=/usr
  make 
}  

package() {
  cd "${srcdir}/$pkgname-$pkgver"
  make prefix="${pkgdir}"/usr install
  
  install -D -d -m755 "${pkgdir}"/usr/share
  install -D -m644 "${srcdir}/$pkgname-$pkgver"/COPYING \
    "${pkgdir}"/usr/share/licenses/"${pkgname}"/LICENSE
}
