# Maintainer: Leyorus <leyorusdev@gmail.com>
# Contributor: Leyorus <leyorusdev@gmail.com>
pkgname=mkvextract-gtk
pkgdesc="Simple Linux GUI to extract tracks from matroska (mkv) files"
url="https://bitbucket.org/Leyorus/mkvextract-gtk/"
license=('GPL2')
arch=('x86_64')
depends=('mkvtoolnix-cli')
makedepends=('gcc' 'pkgconf' 'make' 'cmake' 'boost' 'gtkmm')

# Update following lines for each new release
pkgver=v0.9.3
pkgrel=1
git_sha1="dafe6d0e8772"
md5sums=("8f98b9bf977b100fe55c77e93f7236ec")

source=("https://bitbucket.org/Leyorus/mkvextract-gtk/get/${pkgver}.tar.gz")

build() {
	cd "$srcdir/Leyorus-$pkgname-$git_sha1/"
	cmake . && make
}

package() {
	cd "$srcdir/Leyorus-$pkgname-$git_sha1/"
	mkdir -p "$pkgdir/usr/bin/"
	cp mkvextract-gtk "$pkgdir/usr/bin/"
	chmod +x "$pkgdir/usr/bin"
}
