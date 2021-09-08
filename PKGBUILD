# Maintainer: Peter K. Moss <peter@moss.dk>
pkgname=qmarkdown
pkgver=0.3.2
pkgrel=1
pkgdesc="qMarkdown - minimal markdown viewer"
arch=("x86_64")
url="https://github.com/Peterkmoss/qmarkdown"
license=('GPL')
depends=('qt5-base>=5.9.0' 'qt5-webengine>=5.9.0' 'qt5-webchannel>=5.9.0')
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
sha256sums=('e4a17eb8dc3446d6de423903bc0cef687b758ab259278bbff7fb15d96ae89c3f')
