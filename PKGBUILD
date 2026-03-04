# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>
# Contributor: Sebastian Krzyszkowiak <dos@dosowisko.net>
# Contributor: Kristaps Karlsons <kristaps.karlsons@gmail.com>
# Contributor: Ole Roeßler <ole.roessler@gmail.com>

pkgname=logstalgia
pkgver=1.1.5
pkgrel=1
pkgdesc="replay or stream website access logs as a retro arcade game"
url="https://github.com/acaudwell/Logstalgia"
arch=('i686' 'x86_64')
license=('GPL-3.0')
groups=('system')
makedeps=('boost-libs')
depends=('glibc' 'libgcc' 'libstdc++' 'pcre2' 'sdl2-compat' 'sdl2_image' 'ftgl' 'glew' 'glu' 'glm' 'boost' 'libpng' 'libglvnd' 'freetype2')
source=("${url}/releases/download/${pkgname}-${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('028936e9f663c877d6969ad25f145c7b420797e9a3e01c6c184815ed8309f481')

prepare() {
  cd $pkgname-$pkgver

  autoreconf -fiv
}

build() {
  cd $srcdir/$pkgname-$pkgver

  ./configure --prefix=/usr

  make
}

package() {
  cd $srcdir/$pkgname-$pkgver

  make DESTDIR="$pkgdir/" install
}
