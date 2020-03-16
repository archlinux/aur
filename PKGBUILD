# Maintainer: acxz <akashpatel2008 at yahoo dot com>

pkgname=matplotlib-cpp-git
pkgver=r121.f23347f
pkgrel=1
pkgdesc="Extremely simple yet powerful header-only C++ plotting library built on
         the popular matplotlib"
arch=('i686' 'x86_64')
url='https://github.com/lava/matplotlib-cpp'
license=('MIT')
depends=('gcc' 'python-matplotlib' 'python-numpy' 'python')
optdepends=()
makedepends=('gcc' 'cmake')
provides=('matplotlib-cpp')
_pkgname=matplotlib-cpp
source=(git+https://github.com/lava/${_pkgname})
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    mkdir -p "${pkgdir}/usr/include/${_pkgname}"
    cp "${srcdir}/${_pkgname}/matplotlibcpp.h" "${pkgdir}/usr/include/${_pkgname}"
}
