# Maintainer: Nick Hu <nickhu00@gmail.com>

pkgname=gmailc
pkgver=0.3
pkgrel=1
pkgdesc="A minimalist gmail checker written in C based on curl"
arch=('i686' 'x86_64')
url="https://github.com/NickHu/gmailc"
license=('MIT')
makedepends=('gcc')
depends=('curl' 'libxml2')
source=("https://github.com/NickHu/${pkgname}/archive/${pkgver}.tar.gz")
install=$pkgname.install
md5sums=('cb83ad385e0ac955e033fd4a30bc51c5')

build()
{
  cd ${srcdir}/${pkgname}-${pkgver}
  make
}

package()
{
  install -d ${pkgdir}/usr/bin
  install -m 755 ${srcdir}/${pkgname}-${pkgver}/gmailc ${pkgdir}/usr/bin/gmailc
}
