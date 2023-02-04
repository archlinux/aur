# Contributor: damir <damir at archlinux dot org>
# Contributor: Pierre Chapuis <catwell at archlinux dot us>
# Contributor: aksr <aksr at t-com dot me>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=yudit
pkgver=3.1.0.beta6
pkgrel=1
pkgdesc="A free Unicode plain-text editor for Unix-like systems - beta version"
arch=('i686' 'x86_64')
url="http://www.yudit.org/"
license=('GPL2')
depends=('libx11' 'gcc-libs')
conflicts=('yudit')
provides=('yudit')
optdepends=('hunspell: spell checking')
source=("http://yudit.org/download/betas/${pkgname}-$pkgver.tar.gz")
sha256sums=('566a3d5ccd541d95c4b0796def32d0c07f76a68a8dcd2c3dca4753d6beee6385')

build() {
  cd "${pkgname}-$pkgver"
  ./configure --prefix=/usr
  make
}

package() {
  cd "${pkgname}-$pkgver"
  make DESTDIR="$pkgdir/" install
}
