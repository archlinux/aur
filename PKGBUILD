# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=diff-pdf
pkgver=0.5
pkgrel=1
pkgdesc='A simple tool for visually comparing two PDF files'
arch=('x86_64')
url="http://vslavik.github.io/$pkgname"
license=('GPL')
depends=('poppler-glib' 'wxgtk2')
source=("https://github.com/vslavik/$pkgname/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('e7b8414ed68c838ddf6269d11abccdb1085d73aa08299c287a374d93041f172e')

prepare() {
	cd "$pkgname-$pkgver"
	aclocal
	autoconf
	automake --add-missing --copy --foreign
}

build() {
	cd "$pkgname-$pkgver"
	./configure --prefix=/usr
	make
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}
