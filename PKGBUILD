# Maintainer: Swift Geek
pkgname=ncpamixer
pkgver=1.2
pkgrel=3
pkgdesc="ncurses PulseAudio Mixer"
arch=('i686' 'x86_64' 'armv7h' 'armv6h')
url="https://github.com/fulhax/ncpamixer"
license=('MIT')
depends=('ncurses' 'pulseaudio')
makedepends=('git' 'cmake')
provides=('ncpamixer')
replaces=('ncpamixer-git')
conflicts=('ncpamixer-git')
source=("https://github.com/fulhax/${pkgname}/archive/${pkgver}.tar.gz")
md5sums=('ea470615d8aa317dc51a61446e3a5dc2')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  cmake -DCMAKE_BUILD_TYPE=release ${srcdir}/${pkgname}-${pkgver}/src\
        -DCMAKE_INSTALL_PREFIX="/usr"
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}
