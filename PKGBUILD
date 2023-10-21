# Maintainer: Luca Weiss <luca (at) z3ntu (dot) xyz>
# Contributor: FadeMind <fademind@gmail.com>
# Contributor: Frikilinux <frikilinux at gmail.com>
# Contributor: Artem Sereda <overmind88@gmail.com>

pkgname=kde-thumbnailer-apk
pkgver=1.1
pkgrel=2
pkgdesc="Preview image generator plugin for Android Application Package files"
arch=('i686' 'x86_64')
url="https://github.com/z3ntu/kde-thumbnailer-apk"
license=('GPL')
depends=('kio5')
makedepends=('cmake' 'extra-cmake-modules')
source=("$pkgname-$pkgver.tar.gz::https://github.com/z3ntu/kde-thumbnailer-apk/archive/v1.1.tar.gz")
sha512sums=('6754e77491f7b2b6b4eb37cea3743f56622f93ce914c0c2cdfbcf642c02f32b5b9fe3b737387013a3465a008898db72c41450a2303eb20c116667d4301f2e6fd')

build() {
  mkdir -p $pkgname-$pkgver/build
  cd $pkgname-$pkgver/build
  cmake -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_INSTALL_LIBDIR=lib ..
  make
}

package() {
  cd $pkgname-$pkgver/build
  make DESTDIR="$pkgdir" install
}

# vim:set ts=8 sts=2 sw=2 et:
