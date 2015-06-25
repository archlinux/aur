#
pkgname=libreoffice-extension-minicorrector
_pkgname=minicorrector
pkgver=2.1.2
pkgrel=3
pkgdesc="Performs global search and replace throughout the document in the list of rules."
arch=('any')
url="http://extensions.services.openoffice.org/project/minicorrector"
license=('LGPL')
groups=('libreoffice-extensions')
depends=('libreoffice')
makedepends=('unzip')
#source=('http://extensions.services.openoffice.org/e-files/2305/14/MiniCorrector-2.1.2.oxt')
source=("http://downloads.sourceforge.net/project/aoo-extensions/2305/14/${_pkgname}-${pkgver}.oxt")
noextract=(${source[@]##*/})
md5sums=('bf9eb8d695bfc1286e8c75589485b1eb')

package() {
   _DESTDIR="${pkgdir}/usr/lib/libreoffice/share/extensions/${_pkgname}/"  
   install -dm755 "${_DESTDIR}"  
   unzip -q "$srcdir"/${_pkgname}-${pkgver}.oxt -d "${_DESTDIR}"  
   chmod -R g-w,o-w "${_DESTDIR}"
}

