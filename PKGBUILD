# Contributor: damir <damir at archlinux dot org>
# Contributor: Pierre Chapuis <catwell at archlinux dot us>
# Contributor: aksr <aksr at t-com dot me>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=yudit-beta
pkgver=3.0.6.beta11
pkgrel=1
pkgdesc="A free Unicode plain-text editor for Unix-like systems - beta version"
arch=('i686' 'x86_64')
url="http://www.yudit.org/"
license=('GPL2')
depends=('libx11' 'gcc-libs')
conflicts=('yudit')
provides=('yudit')
optdepends=('hunspell: spell checking')
source=("http://yudit.org/download/betas/${pkgname%-beta}-$pkgver.tar.gz")
sha256sums=('f874bd7ca9539e3a74ce459edc74cadd2c78f267befdccbec79276a5fc6646a1')

build() {
  cd "${pkgname%-beta}-$pkgver"
  ./configure --prefix=/usr
  make
}

package() {
  cd "${pkgname%-beta}-$pkgver"
  make DESTDIR="$pkgdir/" install
}
