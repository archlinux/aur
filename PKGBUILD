#
pkgname=libreoffice-extension-pagination
_pkgname=pagination
pkgver=1.3.10
pkgrel=3
pkgdesc="A little macro that adds a 'Insert / Page number...' dialog to writer. It eases the way you can add page numbers to a document."
arch=('any')
url="http://extensions.services.openoffice.org/project/pagination"
license=('Opensource')
groups=('libreoffice-extensions')
depends=('libreoffice')
makedepends=('unzip')
#source=('http://extensions.services.openoffice.org/e-files/374/17/Pagination-1.3.10.oxt')
source=("http://downloads.sourceforge.net/project/aoo-extensions/374/17/${_pkgname}-${pkgver}.oxt")
noextract=(${source[@]##*/})
md5sums=('3273007fc21e97c56de335c700615190')

package() {
   #mkdir -p "$pkgdir/usr/lib/libreoffice/share/extensions/$_pkgname/"
   #cp -R "$srcdir"/* "$pkgdir/usr/lib/libreoffice/share/extensions/$_pkgname/"
   #rm "$pkgdir/usr/lib/libreoffice/share/extensions/$_pkgname/${_pkgname}-$pkgver.oxt"
   #find "${pkgdir}/usr/lib/libreoffice/share/extensions/$_pkgname/" \( -type d -exec chmod 755 {} \; \) -o \( -type f -exec chmod 644 {} \; \)
   
   _DESTDIR="${pkgdir}/usr/lib/libreoffice/share/extensions/${_pkgname}/"  
   install -dm755 "${_DESTDIR}"  
   unzip -q "$srcdir"/${_pkgname}-${pkgver}.oxt -d "${_DESTDIR}"  
   chmod -R g-w,o-w "${_DESTDIR}"
}

