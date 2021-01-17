# Maintainer: GI Jack <GI_Jack@hackermail.com>
# Based on fwhcat windows10-icon-theme-git package.

pkgname=windows7-icon-theme
_pkgname=Windows-7
pkgver=1.0
pkgrel=1
pkgdesc="Windows 7 icon theme from B00merang"
arch=('any')
url="https://github.com/B00merang-Artwork/Windows-7"
license=('GPL3')
provides=("${pkgname}-git")
conflicts=("${pkgname}-git")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/B00merang-Artwork/Windows-7/archive/${pkgver}.tar.gz")
sha256sums=('dcb05529a93540a66edb1018741e006fd462aac14825a5a9d793765c41fdd01d')

package()
{
	cd "${srcdir}/${_pkgname}-${pkgver}"
	install -d -m 755 "$pkgdir/usr/share/icons/${_pkgname}"
	cp -a * "$pkgdir/usr/share/icons/${_pkgname}"
	rm -f "$pkgdir/usr/share/icons/${_pkgname}/README.md"
	rm "$pkgdir/usr/share/icons/${_pkgname}/apps/mozilla-firefox.png" # Broken symlink with no file in this package
	find "$pkgdir/usr/share/icons/${_pkgname}" -type f -exec chmod 644 {} +
	find "$pkgdir/usr/share/icons/${_pkgname}" -type l -exec chmod -c 644 {} +
}

