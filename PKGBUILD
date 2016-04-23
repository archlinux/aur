pkgname=gien
pkgver=0.1
pkgrel=1
pkgdesc="Tool for exporting Github issue tracker contents to local mbox email storage"
arch=('any')
license=('GPL')
url="https://github.com/2ion/gien"
depends=(\
  'python'                \
  'python-pygithub')
makedepends=('cython' 'pkg-config' 'gcc')
options=(!emptydirs)
source=('https://github.com/2ion/gien/archive/master.tar.gz')
sha256sums=(SKIP)

build()
{
  cd "$srcdir/${pkgname}-master"
  make
}

package()
{
  cd "$srcdir/${pkgname}-master"
  make DESTDIR="$pkgdir/" install
}

