# Maintainer: Thomas Krug <t.krug@elektronenpumpe.de>
# Contributor: Thomas Krug <t.krug@elektronenpumpe.de>
# Maintainer: Cody Schafer <aur@codyps.com>

pkgname=sigrok-cli
pkgver=0.7.1
pkgrel=1
pkgdesc="Client software that supports various hardware logic analyzers, CLI client"
arch=('i686' 'x86_64')
url="http://www.sigrok.org/wiki/Sigrok-cli"
license=('GPL3')
depends=('libsigrok' 'libsigrokdecode')
source=("http://sigrok.org/download/source/${pkgname}/${pkgname}-${pkgver}.tar.gz")
md5sums=('3f45ce664bad529d8b3f78a61b017d75')

build() {
  cd "$srcdir/${pkgname}-${pkgver}"

  ./configure --prefix=/usr

  make
}

package() {
  cd "$srcdir/${pkgname}-${pkgver}"

  make DESTDIR="$pkgdir" PREFIX=/usr install
}

# vim:set ts=2 sw=2 et:
