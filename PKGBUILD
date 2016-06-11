# Maintainer: Pieter Goetschalckx <3.14.e.ter <at> gmail <dot> com>
# Contributor: solsTiCe d'Hiver <solstice.dhiver@gmail.com>

pkgname=audiotag-thumbnailer
pkgver=0.1
pkgrel=1
pkgdesc="A nautilus thumbnailer for MP3 and OGG files"
arch=('any')
url=""
license=("custom:WTFPL")
depends=('mutagen')
install=$pkgname.install
source=("$pkgname" "$pkgname.schemas")
sha256sums=('f58b15d8702b1fc0a91fe8e4949df7d23f85290b41c0004c490102b3593e339e'
            '978074b71b4a2ea9ad17890b23ef27733e2567414d6e87defdd562c1a36affbc')

build() {
	cd $srcdir
	mkdir -p $pkgdir/usr/{share/gconf/schemas,bin}
	install -m644 audiotag-thumbnailer.schemas $pkgdir/usr/share/gconf/schemas
	install -m755 audiotag-thumbnailer $pkgdir/usr/bin
}

package () {
  install -Dm644 "$pkgname.schemas" "$pkgdir/usr/share/gconf/schemas/$pkgname.schemas"
	install -m755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
}
