# Maintainer: Philipp Wolfer <ph.wolfer@gmail.com>

pkgname=libdiscid-sharp
pkgver=0.2.0
pkgrel=2
pkgdesc="Mono bindings for libdiscid"
arch=('i686' 'x86_64')
url="https://github.com/phw/dotnet-discid/"
license=('LGPL')
provides=('libdiscid-sharp')
depends=('mono' 'libdiscid')
makedepends=('git' 'mono')
source=("http://users.musicbrainz.org/~outsidecontext/dotnet-discid/dotnet-discid-0.2.0.tar.gz")
md5sums=('5d18b4bff6ff59c27e3042fdaedabda3')

build() {
  cd dotnet-discid-${pkgver}
  ./configure --prefix=/usr --config=RELEASE
  make
}

package() {
  cd dotnet-discid-${pkgver}
  make DESTDIR=${pkgdir} install
}