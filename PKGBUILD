#
pkgname=libreoffice-extension-altsearch
_pkgname=altsearch
pkgver=1.4.2
pkgrel=1
pkgdesc="Alternative dialog Find & Replace for Writer"
arch=('any')
url="https://extensions.libreoffice.org/extensions/alternative-dialog-find-replace-for-writer"
license=('LGPL')
groups=('libreoffice-extensions')
depends=('libreoffice' 'java-runtime')
makedepends=('unzip')
noextract=(${source[@]##*/})
source=(https://extensions.libreoffice.org/extensions/alternative-dialog-find-replace-for-writer/1-4.2/@@download/file/AltSearch.oxt)
sha512sums=('c8107162f4fd56338728eb3ae8eb5b8bf4ba01bac817bd9c96209e80810cd41d8bdfd8b88c2a6b3300350d468e4fe385cbb0d9f3bd4f1fb2e04ef17ef42438fd')

package() {
   _DESTDIR="${pkgdir}/usr/lib/libreoffice/share/extensions/${_pkgname}/"
   install -dm755 "${_DESTDIR}"
   unzip -q "$srcdir"/AltSearch.oxt -d "${_DESTDIR}"
   chmod -R g-w,o-w "${_DESTDIR}"
}

