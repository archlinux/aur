# Maintainer: xantares <xantares09 at hotmail dot com>

pkgname=psp-pspirkeyb
pkgver=0
pkgrel=1
pkgdesc="This is a library for using IRDA keyboards with Playstation Portable (psp)"
arch=(any)
url="https://github.com/pspdev/psp-ports"
license=('GPL')
groups=('psp')
depends=('psp-sdk')
makedepends=('psp-gcc' 'git')
options=('!buildflags' '!strip' 'staticlibs')
source=("git+https://github.com/pspdev/psp-ports.git"
        0001-Use-PSPDIR-var-in-pspirkeyb-pspgl.patch)
md5sums=('SKIP' 'SKIP')


prepare()
{
  cd "$srcdir/psp-ports"
  patch -p1 -i "$srcdir"/0001-Use-PSPDIR-var-in-pspirkeyb-pspgl.patch
}

build()
{
  cd "$srcdir/psp-ports/pspirkeyb"
  make
}

package()
{
  cd "$srcdir/psp-ports/pspirkeyb"
  make install PSPDIR="$pkgdir"/usr/psp
}

