pkgname=psp-cmake
pkgver=0.1
pkgrel=1
arch=(any)
pkgdesc="CMake wrapper for PSP (psp)"
groups=('psp')
depends=('cmake' 'psp-sdk')
makedepends=('git')
license=("GPL")
url="https://github.com/pspdev/psplibraries/"
source=("git+https://github.com/pspdev/psplibraries.git" psplibraries-cmake.patch)
md5sums=('SKIP' 'SKIP')

prepare() {
  cd "$srcdir"/psplibraries
  patch -Np1 -i "$srcdir"/psplibraries-cmake.patch
}
         
package() {
  cd "$srcdir"/psplibraries/scripts
  sh cmake-toolchain-script.sh "${pkgdir}"
}
