pkgname=psp-oslib-git
pkgver=r144.d8ad579
pkgrel=1
pkgdesc="OldSchool Library (psp)"
arch=(any)
url="https://github.com/dogo/oslibmodv2"
license=('GPL3')
groups=('psp')
depends=('psp-sdk' 'psp-libjpeg' 'psp-libpng')
makedepends=('psp-gcc' 'git')
provides=('psp-oslib')
conflicts=('psp-oslib')
options=('!buildflags' '!strip' 'staticlibs')
source=("git+https://github.com/dogo/oslibmodv2.git")
md5sums=('SKIP')

pkgver()
{
  cd "$srcdir"/oslibmodv2
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build()
{
  cd "$srcdir/oslibmodv2"
  make
}

package()
{
  cd "$srcdir/oslibmodv2"
  make install DESTDIR="$pkgdir"
}

