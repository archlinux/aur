# Maintainer: OIS <mistresssilvara at hotmail com>

pkgname=fb2-thumbnailer
pkgver=0.1
pkgrel=2
pkgdesc="Thumbnailer for FB2 books"
arch=(any)
url="http://zenway.ru/page/fb2info"
license=('GPL-2.0-only')
depends=('python>=3.4' python-pillow)
source=(fb2info.py)
sha256sums=(47c22cac1e2af25e92525347d38c066441cba134f6cb8fef6fe2251cf1e006ee)

package() {
	install -d "$pkgdir/usr/bin"
	install fb2info.py "$pkgdir/usr/bin"  
	mkdir -p "$pkgdir/usr/share/thumbnailers"
	cat << LANIF > "$pkgdir/usr/share/thumbnailers/fb2.thumbnailer"
[Thumbnailer Entry]
Exec=python /usr/bin/fb2info.py %u %o %s
MimeType=application/x-fictionbook+xml;
LANIF
}
