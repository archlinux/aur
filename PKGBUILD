# Maintainer: Jefferson Gonzalez <jgmdev@gmail.com>
# Contributor: Košava <kosava@archlinux.us>

pkgname=qchat
pkgver=0.3
pkgrel=1
pkgdesc="QT4 Local area network (wlan) chat with or without server"
arch=('i686' 'x86_64')
url="http://q-chat.sourceforge.net/"
license=('GPL')
depends=('qt4')
source=(
  'http://sourceforge.net/projects/q-chat/files/QChat/qchat-0.3/qchat-0.3.tar.bz2'
  'qchat.desktop'
)
md5sums=(
  'e94f03d11e4a78dff115c3af8c38bac9'
  '7c0769f294d714770e3d66f30de21273'
)

build() {
  cd ${srcdir}/${pkgname}-${pkgver}
  qmake-qt4 PREFIX="/usr/"
  make INSTALL_DIR=$pkgdir
}

package(){
  cd ${srcdir}/${pkgname}-${pkgver}
  make -j1 INSTALL_ROOT=$pkgdir install
  install -D -m644 $srcdir/${pkgname}.desktop $pkgdir/usr/share/applications/${pkgname}.desktop
}
