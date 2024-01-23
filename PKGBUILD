# Maintainer: aksr <aksr at t-com dot me>
_pkgname=essays1743
pkgname=otf-essays-1743
pkgver=2.100
pkgrel=1
pkgdesc="A font by John Stracke, based on the typeface used in a 1743 English translation of Montaigne's Essays."
arch=('any')
license=('SIL' 'LGPL')
url='http://www.thibault.org/fonts/essays/'
source=("${url}${_pkgname}-${pkgver}-1-otf.tar.gz")
md5sums=('85c3b8887fb54f44f2e63ab1e8ea3426')
sha1sums=('c3b1d70ac5783c83d4958bba9806afaac16a4042')
sha256sums=('2fcb60191f248251cb546e467d6c454fff456961fd8d0d671cac487f45729fde')

package() {
	cd "$srcdir/$_pkgname"
	for i in *.otf; do
		install -Dm644 $i $pkgdir/usr/share/fonts/OTF/$i
	done
	install -D -m644 README $pkgdir/usr/share/doc/${pkgname}/README
	install -D -m644 OFL.txt $pkgdir/usr/share/licenses/${pkgname}/OFL.txt
	install -m644 COPYING $pkgdir/usr/share/licenses/${pkgname}/COPYING
}
