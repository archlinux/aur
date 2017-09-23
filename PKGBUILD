# Contributor: damir <damir at archlinux dot org>
# Contributor: Pierre Chapuis <catwell at archlinux dot us>
# Maintainer: aksr <aksr at t-com dot me>
pkgname=yudit-beta
pkgver=2.9.7.beta4
pkgrel=1
pkgdesc="A free Unicode plain-text editor for Unix-like systems - beta version"
arch=('i686' 'x86_64')
url="http://www.yudit.org/"
license=('GPL')
depends=('libx11' 'gcc-libs')
conflicts=('yudit')
provides=('yudit')
optdepends=('hunspell: spell checking')
source=("http://yudit.org/download/betas/${pkgname%-beta}-$pkgver.tar.gz")
md5sums=('f44002812e3d44e782aa81969d00c3c7')
sha1sums=('4b3b719d93adb0bb1e50f362245a44f970d2b154')
sha256sums=('d8f6a327267aa552dc2afbb391d94eb1ebd5958f416f53708b6ea25b0c1f4892')
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

