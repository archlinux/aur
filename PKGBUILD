 # Maintainer: Leo sk <sk.griffinix@gmail.com>

 pkgname=sierra-breeze-enhanced-decoration-kwin
 _gitname=SierraBreezeEnhanced
 pkgver=1.3.1
 pkgrel=1
 pkgdesc="A fork of BreezeEnhanced to make it (arguably) more minimalistic and informative"
 arch=('x86_64')
 url="https://github.com/kupiqu/SierraBreezeEnhanced/"
 license=('GPL3')
 depends=('kwin')
 makedepends=('cmake' 'extra-cmake-modules')
 source=("${url}archive/refs/tags/V${pkgver}.tar.gz")
 sha256sums=('e507084f359ceb1fd11f4b1a54cbd350601d6cebae837765412da7b5d2744b8c')

 build() {

     cd "${srcdir}/${_gitname}-${pkgver}"

     mkdir build && cd build
     cmake ..  \
     -DCMAKE_INSTALL_PREFIX=/usr \
     -DCMAKE_BUILD_TYPE=Release \
     -DKDE_INSTALL_LIBDIR=lib \
     -DBUILD_TESTING=OFF \
     -DKDE_INSTALL_USE_QT_SYS_PATHS=ON

 }

 package() {
     make -C ${srcdir}/${_gitname}-${pkgver}/build DESTDIR="$pkgdir" install
 }
