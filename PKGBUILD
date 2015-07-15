pkgname=zathura-cb
pkgver=0.1.4
pkgrel=2
pkgdesc="Adds comic book support to zathura"
arch=('i686' 'x86_64')
url="http://pwmt.org/projects/zathura-cb/"
source=(http://pwmt.org/projects/zathura-cb/download/$pkgname-$pkgver.tar.gz)
license=('custom')
depends=('zathura' 'libarchive')
conflicts=('zathura-cb-git')
optdepends=('unrar: cbr support'
            'unzip: cbz support'
            'p7zip: cb7 support'
            'tar: cbt support')
sha1sums=('c27f170bc92c97606f4c3e1568fc08654a4b1564')

build() {
	cd "$srcdir/$pkgname-$pkgver"
	make
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	make DESTDIR="$pkgdir" install
	install -Dm664 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
