# Maintainer: Emma Tebibyte <emma@tebibyte.media>

_pkgbase="busybox"
pkgname="$_pkgbase-coreutils"
pkgver=1.36.0
pkgrel=1
pkgdesc="POSIX-compliant utility applets from BusyBox."
arch=('any')
url="https://busybox.net/"
license=('GPL')
depends=()
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=('busybox' 'coreutils')
source=("https://busybox.net/downloads/$_pkgbase-$pkgver.tar.bz2"
        ".config")
sha256sums=("542750c8af7cb2630e201780b4f99f3dcceeb06f505b479ec68241c1e6af61a5"
            "669c0938e2f5af1693a1fa851245d367b959eea70e3eea6fdd906d07630ebeff")

prepare() {
	cp .config "$_pkgbase-$pkgver/"
}

build() {
	cd "$_pkgbase-$pkgver"
  make install
}

package() {
	cp -r "$srcdir/$_pkgbase-$pkgver/_install/bin/" "$pkgdir/"
	cp -r "$srcdir/$_pkgbase-$pkgver/_install/sbin/" "$pkgdir/"
}
