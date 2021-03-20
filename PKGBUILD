pkgname=psp-libmad-git
pkgver=0.15.1
pkgrel=1
pkgdesc="A high-quality MPEG audio decoder (psp)"
arch=(any)
url="http://shinh.skr.jp/libmad/"
license=('GPL')
groups=('psp')
depends=('psp-sdk')
makedepends=('psp-gcc' 'git')
provides=('psp-libmad')
conflicts=('psp-libmad')
options=('!buildflags' '!strip' 'staticlibs')
source=("git+https://github.com/pspdev/psp-ports.git")
md5sums=('SKIP')

build()
{
  cd "$srcdir/psp-ports/libmad/src"
  make
}

package()
{
  cd "$srcdir/psp-ports/libmad/src"
  make install PSPDIR="$pkgdir"/usr/psp
}

