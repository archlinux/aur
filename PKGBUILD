#
pkgname=libreoffice-extension-cleandoc
_pkgname=cleandoc
pkgver=0.6.7
pkgrel=4
pkgdesc="remove hidden information from the document - macros, dialogs, form elements, user fields, etc."
arch=('any')
url="https://extensions.openoffice.org/en/project/cleandoc.html"
license=('LGPL')
groups=('libreoffice-extensions')
depends=('libreoffice')
makedepends=('unzip')
source=("http://downloads.sourceforge.net/project/aoo-extensions/4798/1/${_pkgname}-${pkgver}.oxt")
noextract=(${source[@]##*/})
md5sums=('27ac9e762f88b0d217662a90fe74a622')

package() {
   _DESTDIR="${pkgdir}/usr/lib/libreoffice/share/extensions/${_pkgname}/"  
   install -dm755 "${_DESTDIR}"  
   unzip -q "$srcdir"/${_pkgname}-${pkgver}.oxt -d "${_DESTDIR}"  
#   chmod -R g-w,o-w "${_DESTDIR}"
   
#   bsdtar -xf ${_pkgname}-${pkgver}.oxt -C "${_DESTDIR}"
   chmod -R a=r,a+X,u+w "${_DESTDIR}"
   chmod -R g-w,o-w "${_DESTDIR}"
}

