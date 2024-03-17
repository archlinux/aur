# Maintainer: Kef Schecter <furrykef@gmail.com>

pkgname=opencity
pkgver=0.0.6.5
_shortver=0.0.6
pkgrel=1
pkgdesc='A simple 3D city simulation game'
arch=('x86_64')
url='http://www.opencity.info/'
license=('GPL-2.0-or-later')
depends=('gcc-libs' 'glibc' 'glu' 'libglvnd' 'sdl12-compat' 'sdl_image' 'sdl_net' 'sdl_mixer')
source=("https://sourceforge.net/projects/opencity/files/Stable/${_shortver}/opencity-${pkgver}stable.tar.bz2")
sha1sums=('f9fd35974fd45e6d8c4453417d01c56b1ef13bca')

build() {
    cd "$pkgname-${pkgver}stable"
    ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var
    make
}

check() {
    cd "$pkgname-${pkgver}stable"
    make -k check
}

package() {
    cd "$pkgname-${pkgver}stable"
    make install DESTDIR="$pkgdir/"
}

