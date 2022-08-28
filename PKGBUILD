# Maintainer: Nikola Hadžić <nikola.hadzic.000@protonmail.com>
pkgname="weatherhs"
pkgver="1.0.0"
pkgrel=2
pkgdesc="Weather and related data info command-line tool"
arch=("x86_64")
url="https://gitlab.com/NH000/weatherhs"
license=("GPL3")
depends=("gettext" "gpgme" "pcre")
makedepends=("git" "stack")
source=("git+$url#tag=28662dc6c9d5450408c4c634f667636263e80ecc")
sha256sums=("SKIP")

package() {
	cd "$srcdir/$pkgname"

    stack build weatherhs --ghc-options=-U__MESSAGE_CATALOG_DIR__
    make install PREFIX="$pkgdir/usr"
}
