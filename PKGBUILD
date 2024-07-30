# Maintainer : silverhikari <kerrickethan@gmail.com>
# Contributor: libele <libele@disroot.org>

pkgname=inform7-ide-bin
pkgver=2.0.0_1
pkgrel=1
pkgdesc="Inform 7 IDE for the Inform 7 programming language for interactive fiction"
arch=('x86_64')
url="https://github.com/ptomato/inform7-ide"
license=('Artistic-2.0' 'GPL-3.0-or-later')
provides=('inform7-ide')
conflicts=('inform7-ide')
depends=('goocanvas2' 'gtksourceview4' 'webkit2gtk')
install=inform7-ide.install
source=("https://github.com/ganelson/inform/releases/download/v10.1.2/inform7-ide-${pkgver//_/-}.fc35.x86_64.rpm")
sha256sums=('0c05fa775a4daab413b812690e8290040ab8b11e67a0e830226740590c6330f4')
options=(!strip)

package() {
  cd "${srcdir}"
  cp -a usr "${pkgdir}"/
  mv "${pkgdir}/usr/lib64"/* "${pkgdir}/usr/lib/"
  rm -r "${pkgdir}/usr/lib64"
}
