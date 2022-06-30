# Maintainer: Peter K. Moss <peter@moss.dk>
pkgname=qmarkdown
pkgver=0.4
pkgrel=1
pkgdesc="qMarkdown - minimal markdown viewer"
arch=("x86_64")
url="https://github.com/Peterkmoss/qmarkdown"
license=('GPL')
depends=('qt6-base>=6.3.0' 'qt6-webengine>=6.3.0' 'qt6-webchannel>=6.3.0')
optdepends=('ttf-roboto')
makedepends=('git' 'cmake>=3.1.0')
provides=('qmarkdown')
conflicts=('qmarkdown-git')
source=("https://github.com/Peterkmoss/qmarkdown/archive/v$pkgver.tar.gz")

build() {
	cd "$pkgname-$pkgver"
	make
}

package() {
	cd "$pkgname-$pkgver"
    make PREFIX=/usr DESTDIR="$pkgdir" install
}
sha256sums=('f4ecd574c7b8d3ccd74e29f449290f77f69bc5b60c5af9423491b9278a295a33')
