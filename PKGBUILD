# $Id: PKGBUILD 220896 2014-09-02 15:36:32Z svenstaro $
# Contributor: Jochem Kossen <j.kossen@home.nl>

pkgname=docker-tray
pkgver=1.5
pkgrel=3
pkgdesc="Docker is a docking application (WindowMaker dock app) which acts as a system tray for KDE and GNOME2."
arch=('i686' 'x86_64')
url="http://icculus.org/openbox/2/docker/"
license=('GPL')
depends=('glibc' 'glib2' 'libx11')
source=("http://icculus.org/openbox/2/docker/docker-$pkgver.tar.gz")
md5sums=('349320bebd43babb8b43e11c7aae0293')

build() {
  cd docker-$pkgver
  make
}

package() {
  cd docker-$pkgver
  install -d "$pkgdir"/usr/bin
  make PREFIX="$pkgdir"/usr install
  mv "$pkgdir"/usr/bin/docker "$pkgdir"/usr/bin/docker-tray
}
