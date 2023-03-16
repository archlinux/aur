# Packager: Den Ivanov <securityxiii at gmail dot com>
# Maintainer: Alex Talker <alextalker at yandex dot ru>
# Contributor: Alessio Biancalana <dottorblaster@gmail.com>

pkgname=4pane
pkgver=8.0
pkgrel=0
pkgdesc="A multi-pane, detailed-list file manager."
arch=('i686' 'x86_64')
url="http://www.4pane.co.uk/index.html"
license=('GPL3')
depends=('wxgtk3')
source=(http://downloads.sourceforge.net/project/fourpane/${pkgver}/${pkgname}-${pkgver}.tar.gz)
md5sums=('c3eb8f5f2a9857b824a79b8098ed1f25')

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
