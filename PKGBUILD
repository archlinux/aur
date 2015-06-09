pkgname=libreoffice-extension-writer2epub
_pkgname=writer2epub
pkgver=1.1.28
pkgrel=3
pkgdesc="Extension for creating ePub files from Libreoffice"
arch=('any')
url="http://writer2epub.it/en/"
license=('LGPL')
groups=('libreoffice-extensions')
depends=('libreoffice' 'java-runtime')
makedepends=('unzip')
noextract=(${source[@]##*/})
source=(http://writer2epub.it/wp-content/files/writer2epub.oxt)

md5sums=('52bab6e7ab8029eae5d681a39dadc0e5')

package() {
   _DESTDIR="${pkgdir}/usr/lib/libreoffice/share/extensions/${_pkgname}/"
   install -dm755 "${_DESTDIR}"
   unzip -q "$srcdir"/${_pkgname}.oxt -d "${_DESTDIR}"
   chmod -R g-w,o-w "${_DESTDIR}"
}



