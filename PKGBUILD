# Contributor: Bogdan "tb" Szczurek <thebodzio@gmail.com>

pkgname=color-icc-adobe
_pkgname='Adobe ICC Profiles (end-user)'
_colordir=usr/share/color/icc
_docdir=usr/share/doc
_licdir=usr/share/licenses
pkgver=cs4
pkgrel=1
pkgdesc='ICC profiles from Adobe'
arch=('any')
url='http://www.adobe.com/support/downloads/detail.jsp?ftpID=4075'
license=('custom')
source=('http://download.adobe.com/pub/adobe/iccprofiles/win/AdobeICCProfilesCS4Win_end-user.zip')
md5sums=('82879176584c66d243a4ea85c5ebb14e')

package() {

	# profiles
	install -d -m755 $pkgdir/$_colordir
	for profile in "$srcdir/$_pkgname/"{CMYK,RGB}/*; do
		install -m644 "$profile" $pkgdir/$_colordir
	done;

	# documentation
	install -d -m755 $pkgdir/$_docdir/$pkgname
	install -m644 "$srcdir/$_pkgname/Profile Information.pdf" \
		$pkgdir/$_docdir/$pkgname
	
	# license
	install -d -m755 $pkgdir/$_licdir/$pkgname
	install -m644 "$srcdir/$_pkgname/Color Profile EULA.pdf" \
		"$srcdir/$_pkgname/Trademark Information.pdf" \
		$pkgdir/$_licdir/$pkgname
}

# vim: set ts=4 sw=4 ai inde=:
