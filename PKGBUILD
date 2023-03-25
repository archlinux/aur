 # Maintainer: Leo sk <sk.griffinix@gmail.com>

 pkgname=sierra-breeze-enhanced
 _gitname=SierraBreezeEnhanced
 pkgver=1.3.3
 pkgrel=1
 pkgdesc="A kwin decoration with support for transparency, rounded corners, multiple titlebar button presets and more"
 arch=('x86_64')
 url="https://github.com/kupiqu/SierraBreezeEnhanced/"
 license=('GPL3')
 depends=('kwin')
 makedepends=('cmake' 'extra-cmake-modules')
 source=("${url}archive/refs/tags/V${pkgver}.tar.gz")
 sha256sums=('37d10ee089091e33b48d27829c0659a2240c55bcb8b762fddd03cc6ab59458c0')

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
