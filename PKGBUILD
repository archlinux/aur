# Maintainer: David Danier <david.danier@team23.de>
pkgname=gitslave
pkgver=2.0.2
pkgrel=1
pkgdesc="Gits - The git slave repository tool for super-project multi-repository management"
arch=('any')
url="http://gitslave.sourceforge.net"
license=('custom')
depends=('perl>=5', 'git')
makedepends=('git')
source=(
    "http://downloads.sourceforge.net/${pkgname}/${pkgname}-${pkgver}.tar.gz"
)

package(){
  cd "$srcdir/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}/" install prefix=/usr
  make DESTDIR="${pkgdir}/" install -C contrib prefix=/usr
  install -D -m644 LICENSE.TXT "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

sha256sums=('8aa3dcb1b50418cc9cee9bee86bb4b279c1c5a34b7adc846697205057d4826f0')
