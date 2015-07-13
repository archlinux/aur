# Maintainer: Thomas Krug <t.krug@elektronenpumpe.de>
# Contributor: Thomas Krug <t.krug@elektronenpumpe.de>

pkgname=libsigrokdecode
pkgver=0.3.1
pkgrel=1
pkgdesc="Client software that supports various hardware logic analyzers, protocol decoders library"
arch=('i686' 'x86_64')
url="http://www.sigrok.org/wiki/Libsigrokdecode"
license=('GPL3')
depends=('glib2' 'python')
source=("http://sigrok.org/download/source/${pkgname}/${pkgname}-${pkgver}.tar.gz")
md5sums=('39d96f51800c8602fad90996f638ea90')

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
