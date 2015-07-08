# Maintainer: Lukas Fleischer <archlinux at cryptocrack dot de>
# Contributor: SmackleFunky <smacklefunky@optusnet.com.au>
# Contributor: Slash <demodevil5[at]yahoo[dot]com>

pkgname=hsetroot
pkgver=1.0.2
pkgrel=4
pkgdesc='A tool which allows you to compose wallpapers for X.'
url='http://www.thegraveyard.org/hsetroot.php'
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
