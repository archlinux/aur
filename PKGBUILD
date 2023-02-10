# Maintainer: Rudy Matela <rudy@matela.com.br>
# Contributor: Rudy Matela <rudy@matela.com.br>
# Contributor: Max R. P. Grossmann <m@max.pm>
# Contributor: Pierre Neidhardt <ambrevar@gmail.com>
# Contributor: Thorsten Töpper <atsutane-tu@freethoughts.de>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Giovanni Scafora <giovanni@archlinux.org>
# Contributor: Daniel J Griffiths <ghost1227@archlinux.us>

pkgname=ccrypt
pkgver=1.11
pkgrel=2
pkgdesc="A tool for encrypting and decrypting files and streams."
arch=('x86_64')
url="https://ccrypt.sourceforge.net/"
license=('GPL2')
depends=('libxcrypt')
makedepends=()
source=("https://ccrypt.sourceforge.net/download/${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha1sums=('6d20a4db9ef7caeea6ce432f3cffadf10172e420')
sha256sums=('b19c47500a96ee5fbd820f704c912f6efcc42b638c0a6aa7a4e3dc0a6b51a44f')

build() {
	cd "$pkgname-$pkgver"
	./configure --prefix=/usr
	make
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir" install
}
