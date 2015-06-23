# Maintainer: Daniel Sandman <revoltism@gmail.com>

pkgname=pachist-git
pkgver=0
pkgrel=1
pkgdesc="A small bash program to show the installed package history in Arch Linux."
arch=('i686' 'x86_64')
url="https://github.com/Almehdi/pachist"
license=('GPL3')
#depends=('colout-git')
makedepends=('git')
conflicts=('pachist')
provides=('pachist')
source=("$pkgname"::'git+https://github.com/Almehdi/pachist.git#branch=master')
md5sums=('SKIP')

pkgver() {
     cd "$srcdir/$pkgname"
	 echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

build() {
     cd "$srcdir/$pkgname"
}

package() {
     cd "$srcdir/$pkgname"
     install -D -m755 pachist "$pkgdir/usr/bin/pachist"
     install -D -m644 pachist.1.gz "$pkgdir/usr/share/man/man1/$pkgname.1.gz"
     install -D -m644 README.md "$pkgdir/usr/share/doc/$pkgname/README"
     install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
