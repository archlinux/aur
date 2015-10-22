pkgname=libreoffice-extension-romanian-dictionary-pack
_pkgname=dict-ro
pkgver=1.7
pkgrel=1
pkgdesc="LibreOffice extension that provides Romanian Dictionary Pack (spell checker, hyphenation, thesaurus)"
arch=('any')
url="http://extensions.openoffice.org/en/project/romanian-dictionary-pack-spell-checker-hyphenation-thesaurus"
license=('LGPL')
groups=('libreoffice-extensions')
epends=('libreoffice' 'java-runtime')
makedepends=('unzip')
noextract=(${source[@]##*/})
source=('http://heanet.dl.sourceforge.net/project/aoo-extensions/1392/10/dict-ro.1.7.oxt')

md5sums=('c7e22272fd8de1d50fe3b077153be274')

package() {
   _DESTDIR="${pkgdir}/usr/lib/libreoffice/share/extensions/${_pkgname}/"
   _ver=".1.7"
   install -dm755 "${_DESTDIR}"
   unzip -q "$srcdir"/${_pkgname}${_ver}.oxt -d "${_DESTDIR}"
   chmod -R g-w,o-w "${_DESTDIR}"
}
