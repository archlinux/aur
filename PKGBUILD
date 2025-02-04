# Maintainer: robertfoster

pkgname=oyranos
pkgver=0.9.6 # renovate: datasource=github-tags depName=oyranos-cms/oyranos
pkgrel=1
pkgdesc="A Colour Management System (CMS) on operating system level."
url="http://oyranos.org/"
arch=('i686' 'x86_64')
makedepends=(cmake yajl)
depends=(libxml2 libxinerama libxrandr libxfixes libxxf86vm doxygen graphviz lcms2 libraw libxcm)
optdepends=(fltk qt5-x11extras elektra exiv2 cups sane cairo openicc xcalib)
source=("https://github.com/oyranos-cms/oyranos/archive/$pkgver.tar.gz")
license=('MIT')

build() {
  cd $srcdir/$pkgname-$pkgver

  ./configure --prefix=/usr --enable-threads --enable-xft --enable-shared --libdir=/usr/lib
  make
}

package() {
  cd $srcdir/$pkgname-$pkgver
  make DESTDIR=$pkgdir install
}

sha256sums=('44b0e451ccd80617484eaa824ce609bf2982f523ffc4c6350bca755037a52b9b')
