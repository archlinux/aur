# Contributor: xantares <xantares09 at hotmail dot com>

pkgname=psp-opengl
_commit=30ffef7bb75ba70eccede93288d7bb429a2e4709
pkgver=r12.30ffef7
pkgrel=1
pkgdesc="OpenGL libraries for PSP"
arch=(any)
url="https://github.com/pspdev/pspgl"
license=('BSD')
groups=('psp')
depends=('psp-sdk')
makedepends=('psp-gcc' 'git')
options=('!buildflags' '!strip' 'staticlibs')
source=("git+https://github.com/pspdev/pspgl.git#commit=$_commit")
md5sums=('SKIP')

pkgver() {
  cd pspgl
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build()
{
  cd "$srcdir/pspgl"
  make
}

package()
{
  cd "$srcdir/pspgl"
  make install PSPPATH="$pkgdir"/usr/psp
}
