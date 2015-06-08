# Maintainer: xantares <xantares09 at hotmail dot com>

pkgname=psp-opengl
pkgver=0.2
pkgrel=1
pkgdesc="hardware-accelerated implementation of OpenGL for the Playstation Portable (psp)"
arch=(any)
url="http://www.goop.org/psp/gl/"
license=('GPL')
groups=('psp')
depends=('psp-sdk')
makedepends=('psp-gcc')
options=('!buildflags' '!strip' 'staticlibs')
source=("git+https://github.com/pspdev/psp-ports.git")
md5sums=('SKIP')

build()
{
  cd "$srcdir/psp-ports/pspgl"
  make
}

package()
{
  cd "$srcdir/psp-ports/pspgl"
  make install PSPPATH="$pkgdir"/usr/psp
}

