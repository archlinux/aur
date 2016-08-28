# Maintainer: thr <r at sledinmay dot com>
# Contributor: MAZ_1 <loveayawaka 'at' gmail 'dot' com>
 
pkgname=lib32-glitz
pkgver=0.5.6
pkgrel=3
pkgdesc="OpenGL image compositing library"
arch=('x86_64')
url="http://cairographics.org/"
makedepends=('gcc-multilib')
depends=('lib32-libgl' 'lib32-glibc' 'glitz')
license=('BSD')
source=("http://cairographics.org/snapshots/glitz-$pkgver.tar.gz")
md5sums=('c507f140ecccc06aed8888c958edda4c')

build() {
cd glitz-${pkgver}
./configure --prefix=/usr --libdir=/usr/lib32 CC='gcc' CFLAGS='-m32 -O2' PKG_CONFIG_PATH='/usr/lib32/pkgconfig/'
make
}

package() {
cd glitz-${pkgver}
DESTDIR="${pkgdir}" make install 
rm -rf ${pkgdir}/usr/include
}