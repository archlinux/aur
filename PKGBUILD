pkgname=nibl
pkgver=0.4.1
pkgrel=2
pkgdesc="Command line interface to the NIBL XDCC package search"
arch=('any')
license=('GPL')
url="https://github.com/2ion/nibl"
depends=(\
  'python'                \
  'python-termcolor'      \
  'python-terminaltables' \
  'python-beautifulsoup4' \
  'python-requests'       \
  'python-progressbar')
makedepends=('cython' 'pkg-config' 'gcc')
options=(!emptydirs)
source=('https://github.com/2ion/nibl/archive/master.tar.gz')
sha256sums=(SKIP)

build()
{
  cd "$srcdir/nibl-master"
  make
}

package()
{
  cd "$srcdir/nibl-master"
  make DESTDIR="$pkgdir/" install
}

