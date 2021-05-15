# Maintainer: Alex Talker <alextalker at yandex dot ru>
# Contributor: Alessio Biancalana <dottorblaster@gmail.com>

pkgname=4pane
pkgver=7.0
pkgrel=2
pkgdesc="A multi-pane, detailed-list file manager."
arch=('i686' 'x86_64')
url="http://www.4pane.co.uk/index.html"
license=('GPL3')
depends=('wxgtk2')
source=(http://downloads.sourceforge.net/project/fourpane/${pkgver}/${pkgname}-${pkgver}.tar.gz)
md5sums=('21d0a32400aa5fb48b1e5f8c5c344c42')

build() {
  cd ${srcdir}/${pkgname}-${pkgver}

  ./configure --prefix=/usr --disable-symlink
  make
}

package() {
  cd ${srcdir}/${pkgname}-${pkgver}

  make DESTDIR=${pkgdir} install

  install -d -m755 ${pkgdir}/usr/share/applications
  cd "${pkgdir}/usr/share/applications"
  ln -s ../4Pane/rc/4Pane.desktop 4Pane.desktop
}
