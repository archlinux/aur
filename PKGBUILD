pkgname='simple-thumbnailer-pdf'
pkgver=r2.e3e013c
pkgrel=1
pkgdesc='Minimal PDF thumbnailer for GNOME'
arch=('any')
url=""
license=('GPL')
depends=('poppler')
conflicts=('evince') # evince already provides PDF thumbnailing support
source=('git+https://gitlab.com/zoli111/simple-thumbnailers')
sha256sums=('SKIP')

pkgver() {
	cd "simple-thumbnailers"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

package() {
	cd "simple-thumbnailers/pdf/"
	install -d "$pkgdir/usr/bin/" "$pkgdir/usr/share/thumbnailers/"
	install simple-thumbnailer-pdf "$pkgdir/usr/bin/"
	install simple-thumbnailer-pdf.thumbnailer "$pkgdir/usr/share/thumbnailers/"
}
