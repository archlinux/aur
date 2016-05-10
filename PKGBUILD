pkgname=ayam
pkgver=1
pkgrel=1
pkgdesc="Ayam is a free 3D modelling environment for the RenderMan interface."
arch=('i686' 'x86_64')
url="https://sourceforge.net/projects/ayam/"
license=('BSD')
depends=('libtiff4')
makedepends=('coreutils')
conflicts=()

source_i686=(https://sourceforge.net/projects/ayam/files/Ayam/1.23/ayam1.23.linux.i386.tar.gz/download)
source_x86_64=(https://sourceforge.net/projects/ayam/files/Ayam/1.23/ayam1.23.linux.amd64.tar.gz/download)

md5sums_i686=('175769c393cd97b07f194fc6a237d18a')
md5sums_x86_64=('175769c393cd97b07f194fc6a237d18a')

package() {
  cd "$srcdir/bin"

  make DESTDIR="$pkgdir/" install
  make DESTDIR="$pkgdir/" sysmenu
  make DESTDIR="$pkgdir/" desktop
  make DESTDIR="$pkgdir/" filetype

  export PATH=$PATH:/usr/local/ayam/bin
  export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/ayam/bin/plugins
}
