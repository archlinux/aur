# Maintainer: 
# Based on fwhcat windows10-icon-theme-git package.

pkgname=windows10-icon-theme
pkgver=1.0
pkgrel=1
pkgdesc="Windows 10 icon theme"
arch=('any')
url="https://github.com/B00merang-Artwork/Windows-10"
license=('GPL3')
provides=("${pkgname}-git")
conflicts=("${pkgname}-git")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/B00merang-Artwork/Windows-10/archive/${pkgver}.tar.gz")
sha1sums=('0de5edd89e5a82165ee34abbbb86bebc31d5fa7c')


package()
{
	cd "${srcdir}/Windows-10-${pkgver}"
	install -d -m 755 "$pkgdir/usr/share/icons/Windows10"

	cp -a * "$pkgdir/usr/share/icons/Windows10"
	rm -f "$pkgdir/usr/share/icons/Windows10/README.md"
	find "$pkgdir/usr/share/icons/Windows10" -type f -exec chmod 644 {} +
	find "$pkgdir/usr/share/icons/Windows10" -type l -exec chmod -c 644 {} +
}

