# Maintainer: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>
# Contributor: Jeremy Cowgar <jeremy@cowgar.com>

pkgname=aft
pkgver=5.098
pkgrel=1
pkgdesc="Almost Free Text: a document preparation system, mostly free from intrusive markup"
arch=('any')
url="http://www.maplefish.com/todd/aft.html"
license='custom: "The Clarified Artistic License"'
depends=('perl')
source=(http://www.maplefish.com/todd/$pkgname-$pkgver.tar.gz)
md5sums=('ef6178d35978625a5cd00663740d63cc')

build() {
  cd "${srcdir}"/$pkgname-$pkgver

  ./configure --prefix=/usr --sysconfdir=/etc
  make
}

package() {
  cd "${srcdir}"/$pkgname-$pkgver

  make DESTDIR="${pkgdir}" install
#License
  install -D -m644 COPYING ${pkgdir}/usr/share/licenses/$pkgname/COPYING
}
