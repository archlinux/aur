# Maintainer: Dmitry Kharitonov <darksab0r at gmail com>
# Contributor: Matthias Grosser <mtgrosser at gmx dot net>
# Contributor: Leonard de Ruijter <leonard@aur.archlinux.org>

pkgname=shine
pkgver=3.1.1
pkgrel=1
pkgdesc='Super fast fixed-point MP3 encoder'
arch=('arm' 'i686' 'x86_64')
url="https://github.com/savonet/shine"
source=(https://github.com/toots/$pkgname/releases/download/$pkgver/$pkgname-$pkgver.tar.gz)
license=(GPL2)
depends=('glibc')
makedepends=('automake' 'autoconf' 'make' 'libtool')
options=('!libtool' '!strip')
sha256sums=('58e61e70128cf73f88635db495bfc17f0dde3ce9c9ac070d505a0cd75b93d384')
build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
        ./bootstrap
	./configure --prefix=/usr
        make all
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}

