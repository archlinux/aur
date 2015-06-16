# Maintainer: Markus Kalb <mk@filmkreis.tu-darmstadt.de>
# Contributor: Stefan Karner <stefan.karner@student.tuwien.ac.at>
pkgname=dcpomatic-git
pkgver=0.r4513.00d7c10
pkgrel=3
pkgdesc="A free, open-source program to generate Digital Cinema Packages (DCPs) from videos or images"
arch=('i686' 'x86_64')
url="http://dcpomatic.com/"
license=('GPL2')
depends=('libcxml-git' 'libdcp-git' 'ffmpeg' 'glib2' 'imagemagick' 'openjpeg>=1.5.0' 'openjpeg<=1.5.2' 'libssh' 'wxgtk>=3.0.1' 'libquickmail>=0.1.19' 'libzip' 'xz' 'libsndfile')
makedepends=('python2' 'boost>=1.45' 'git')
provides=('dcpomatic')
conflicts=('dcpomatic')
source=('dcpomatic-git::git+https://github.com/cth103/dcpomatic.git')
sha256sums=('SKIP')

pkgver() {
  cd dcpomatic-git
  printf "0.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}


build() {
  cd  dcpomatic-git
  python waf configure --prefix=/usr
  python waf build
}


package() {
  cd dcpomatic-git
  python waf install --destdir=$pkgdir
}
