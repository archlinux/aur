# Maintainer: Anna Ivanova <kalterfx@gmail.com>

pkgname=noticeditor-git
pkgver=344.12cc720
pkgrel=1
pkgdesc="The Notice Editor"
arch=('i686' 'x86_64')
url="https://github.com/TemporaryTeam/NoticEditor"
license=("Apache")
depends=('java-runtime' 'java-openjfx')
makedepends=('java-environment' 'java-openjfx' 'gradle')
source=("git+https://github.com/TemporaryTeam/NoticEditor")
md5sums=('SKIP')

pkgver()
{
	cd "$srcdir/NoticEditor"
	echo "$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/NoticEditor"
	make
}

package() {
	cd "$srcdir/NoticEditor"
	make PREFIX=/usr DESTDIR="$pkgdir" install
}
