# Contributor: damir <damir at archlinux dot org>
# Contributor: Pierre Chapuis <catwell at archlinux dot us>
# Contributor: aksr <aksr at t-com dot me>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=yudit-beta
pkgver=3.0.4.beta39
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
sha256sums=('6fd42def2759c80111cdb9dd1657ca20c070cbe3afeef3091161481c1a648b2f')
validpgpkeys=()

build() {
  cd "${pkgname%-beta}-$pkgver"
  ./configure --prefix=/usr
  make
}

package() {
  cd "${pkgname%-beta}-$pkgver"
  make DESTDIR="$pkgdir/" install
}
