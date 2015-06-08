
pkgname=psp-libpspvram
pkgver=0.0.1
pkgrel=1
pkgdesc="Dynamic VRAM allocation manager (psp)"
arch=(any)
url="https://github.com/pspdev/psp-ports"
license=('GPL')
groups=('psp')
depends=('psp-sdk')
makedepends=('psp-gcc' 'git')
options=('!buildflags' '!strip' 'staticlibs')
source=("git+https://github.com/pspdev/psp-ports.git")
md5sums=('SKIP')

build()
{
  cd "$srcdir/psp-ports/libpspvram"
  make
}

package()
{
  cd "$srcdir/psp-ports/libpspvram"
  install -d "$pkgdir"/usr/psp/{lib,include}
  make install PSPDIR="$pkgdir"/usr/psp
}

