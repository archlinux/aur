# Maintainer: Antonio Vázquez Blanco <antoniovazquezblanco@gmail.com>
pkgname=graudit
pkgver=1.9
pkgrel=1
pkgdesc="Grep rough source code auditing tool."
arch=(any)
url="https://github.com/wireghoul/graudit"
license=('GPL')
source=(http://www.justanotherhacker.com/projects/${pkgname}-${pkgver}_src.tar.gz)
md5sums=('bc7d05f29c87fc21fa3d16da690aead1')

build() {
  cd "$pkgname-$pkgver"

  # TODO: Should only use /usr as prefix but makefile doesn't support DESTDIR...
  ./configure --prefix "$pkgdir/usr/bin" --dbdir "$pkgdir/usr/share/graudit"

  # TODO: In the future should make here...
}

package() {
  cd "$pkgname-$pkgver"

  # TODO: Should use DESTDIR but it is not supported yet...
  # make DESTDIR="$pkgdir/" install
  make install
}
