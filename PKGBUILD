# Maintainer: pliski <pliski@pli.ski>
_srcname=nemo-webp
pkgname="$_srcname-git"
pkgver=1.0.0.r6.ff9a489
pkgrel=1
pkgdesc="WebP image format support for thumbnails in Nemo"
arch=('any')
url="https://github.com/pliski/$_srcname.git"
license=('GPL-3.0-or-later')
depends=('nemo' 'libwebp')  
makedepends=('git')
provides=("$_srcname")
conflicts=("$_srcname")
source=("git+$url")
sha256sums=('SKIP')

pkgver() {
	cd $_srcname
	printf "1.0.0.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "$_srcname"
	mkdir -p "$pkgdir/usr/share/thumbnailers"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$_srcname/LICENSE"
	install -Dm644 README.md "$pkgdir/usr/share/doc/$_srcname/README.md"
	install -Dm644 webp.thumbnailer "$pkgdir/usr/share/thumbnailers/webp.thumbnailer"
}
