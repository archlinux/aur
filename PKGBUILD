# Maintainer: Lucas Saliés Brum <lucas at archlinux dot com dot br>
# Contributor: Lukas Fleischer <archlinux at cryptocrack dot de>
# Contributor: SmackleFunky <smacklefunky at optusnet dot com dot au>
# Contributor: Slash <demodevil5 at yahoo dot com>

pkgname=hsetroot
pkgver=1.0.2
pkgrel=5
pkgdesc='A tool which allows you to compose wallpapers for X.'
# url='http://www.thegraveyard.org/hsetroot.php'
url='https://directory.fsf.org/wiki/Hsetroot'
license=('GPL')
depends=('imlib2' 'xorg-server')
arch=('i686' 'x86_64')
source=("ftp://ftp.netbsd.org/pub/pkgsrc/distfiles/${pkgname}-${pkgver}.tar.gz")
md5sums=( 'f599770a6411dcfe216c37b280fad9bc')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  LDFLAGS="-lX11" ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}
