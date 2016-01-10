# Maintainer: Dmitry Kharitonov <darksab0r at gmail com>
# Contributor: kfgz <kfgz at interia pl>
# Contributor: sonic414 <kevinjf at live dot in>
		
pkgname=delaycut-qt5-git
pkgver=v1.4.3.7.1.0.g521bf6d
pkgrel=1
pkgdesc="Delaycut corrects delay and is also able to cut audio files coded ac3, dts, mpa and wav. It's also able to fix CRC errors in ac3 and mpa files. (GIT Version)"
arch=('i686' 'x86_64')
url='https://github.com/darealshinji/delaycut'
license=GPL3
depends=('qt5-base')
conflicts=('delaycut')
provides=('delaycut')
source=(git+https://github.com/darealshinji/delaycut.git)
sha1sums=('SKIP')

pkgver() {
  cd delaycut
  echo "$(git describe --long --tags | tr - .)"
}

build() {
  cd delaycut
  qmake-qt5 CONFIG+=Linux
  make
}

package () {
  cd delaycut
  install -Dm755 delaycut "${pkgdir}"/usr/bin/delaycut
  install -Dm644 extra/delaycut.desktop "${pkgdir}"/usr/share/applications/delaycut.desktop
  install -Dm644 extra/delaycut.xpm "${pkgdir}"/usr/share/pixmaps/delaycut.xpm  
}