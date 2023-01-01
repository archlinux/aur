# Contributor: damir <damir at archlinux dot org>
# Contributor: Pierre Chapuis <catwell at archlinux dot us>
# Contributor: aksr <aksr at t-com dot me>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=yudit-beta
pkgver=3.0.8.beta20
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
sha256sums=('5ed6f17802b24427972885ee2b7b852b02a873e76162ab3c80d6d7974fa1ce04')

build() {
  cd "${pkgname%-beta}-$pkgver"
  ./configure --prefix=/usr
  make
}

package() {
  cd "${pkgname%-beta}-$pkgver"
  make DESTDIR="$pkgdir/" install
}
