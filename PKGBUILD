# Maintainer: Oliver Lantwin	<olantwin+aur@gmail.com>
# Contributor: strigyskow

pkgname=open-pdf-presenter
pkgver=0.3.0
pkgrel=2
pkgdesc="A program for presenting PDFs featuring a presenter console on an auxiliary monitor"
arch=('i686' 'x86_64')
url="http://code.google.com/p/open-pdf-presenter/"
license=('GPL')
groups=()
depends=('qt4' 'poppler-qt4')
source=("https://storage.googleapis.com/google-code-archive-downloads/v2/code.google.com/open-pdf-presenter/open-pdf-presenter-$pkgver.tar.gz")
sha1sums=('afc8a5f6c15904f6746be36df9fb15065188ff14')

build() {
	cd "$srcdir/$pkgname-$pkgver"
	qmake-qt4 PREFIX="/usr"
	make
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	make INSTALL_ROOT="$pkgdir" install
}
