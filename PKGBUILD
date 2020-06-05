# Contributor: damir <damir at archlinux dot org>
# Contributor: Pierre Chapuis <catwell at archlinux dot us>
# Maintainer: aksr <aksr at t-com dot me>
pkgname=yudit
pkgver=3.0.5
pkgrel=1
pkgdesc="A free Unicode plain-text editor for Unix-like systems."
arch=('i686' 'x86_64')
url="http://www.yudit.org/"
license=('GPL')
depends=('libx11')
optdepends=('hunspell: spell checking')
source=("http://yudit.org/download/$pkgname-$pkgver.tar.gz")
md5sums=('bee6011261f836784aa15b1710fd5dae')
sha1sums=('0d14822be2ae6d72bc256a7cbcb6e4fd8788f669')
sha256sums=('cddeb559c36dece12157a527f19d7220e88d916ccf9336b48b263f04c966d382')
sha512sums=('53513e8932574d909bbe3687be0ea5f0a434e3c1e3078f3e26713007cd93dbef407de64d2e0628e8b5e8aa0231557f9e6befb7146a21e57a6bfd7880a669d91a')

build() {
	cd "$pkgname-$pkgver"
	./configure --prefix=/usr
	make
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}

