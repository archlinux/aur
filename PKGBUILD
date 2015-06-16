# Maintainer: Markus Kalb <mk@filmkreis.tu-darmstadt.de>
# Contributor: Stefan Karner <stefan.karner@student.tuwien.ac.at>
pkgname=dcpomatic
pkgver=1.79.0 
pkgrel=3
pkgdesc="A free, open-source program to generate Digital Cinema Packages (DCPs) from videos or images"
arch=('i686' 'x86_64')
url="http://dcpomatic.com/"
license=('GPL2')
depends=('libcxml>=0.11.0' 'libdcp>=0.101.0' 'ffmpeg' 'glib2' 'imagemagick' 'openjpeg>=1.5.0' 'openjpeg<=1.5.2' 'libssh' 'wxgtk>=3.0.1' 'libquickmail>=0.1.19' 'libzip' 'xz' 'libsndfile')
makedepends=('python2' 'boost>=1.45' )
source=("http://dcpomatic.com/downloads/${pkgver}/${pkgname}-${pkgver}.tar.bz2")
sha256sums=('458d2301f664864b5e5f62c14e651d5f96274a7471aee3aa3a00b57cb4b5b723')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python2 waf configure --prefix=/usr
  python2 waf build
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python2 waf install --destdir=$pkgdir
}
