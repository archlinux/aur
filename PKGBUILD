#
pkgname=libreoffice-extension-altsearch
_pkgname=altsearch
pkgver=1.4
pkgrel=2
pkgdesc="Alternative dialog Find & Replace for Writer"
arch=('any')
#url="http://extensions.openoffice.org/en/project/alternative-dialog-find-replace-writer-altsearch"
url="http://extensions.libreoffice.org/extension-center/alternative-dialog-find-replace-for-writer"
license=('LGPL')
groups=('libreoffice-extensions')
depends=('libreoffice' 'java-runtime')
makedepends=('unzip')
noextract=(${source[@]##*/})
source=(http://extensions.libreoffice.org/extension-center/alternative-dialog-find-replace-for-writer/releases/${pkgver}/${_pkgname}.oxt)
md5sums=('59459be513d68eee75185658113242f5')

package() {
   _DESTDIR="${pkgdir}/usr/lib/libreoffice/share/extensions/${_pkgname}/"
   install -dm755 "${_DESTDIR}"
   unzip -q "$srcdir"/${_pkgname}.oxt -d "${_DESTDIR}"
   chmod -R g-w,o-w "${_DESTDIR}"
}

