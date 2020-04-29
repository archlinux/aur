pkgname=psp-sdk-base
pkgver=1.0
pkgrel=1
pkgdesc="An open-source SDK for PSP homebrew development (bootstrap) (psp)"
arch=(any)
url="https://github.com/pspdev/pspsdk"
license=('GPL')
groups=('psp')
depends=('zlib')
makedepends=('psp-gcc-base')
conflicts=('psp-sdk')
options=('!buildflags' '!strip' 'staticlibs')
source=("https://github.com/pspdev/pspsdk/archive/master.zip")
md5sums=('SKIP')

build()
{
  cd "$srcdir/pspsdk-master"
  ./bootstrap
  ./configure --with-pspdev=/usr
}

package()
{
  cd "$srcdir/pspsdk-master"
  make install-data DESTDIR="$pkgdir"
}

