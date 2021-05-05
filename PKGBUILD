# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=commit
pkgver=2.0.0
pkgrel=2
pkgdesc="Commit message editor."
arch=('x86_64')
url="https://github.com/sonnyp/Commit"
license=('GPL3')
depends=('gjs' 'gtk3')
makedepends=('meson')
#checkdepends=('appstream-glib')
optdepends=('git: git support'
            'mercurial: mercurial support'
            'gspell: spell checking support')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('25878bf684f90e67bafa10e27da36df84959376ede3636f81eb03a56c1328a8c')

build() {
	arch-meson Commit-$pkgver build
	meson compile -C build
}

#check() {
#	meson test -C build --print-errorlogs
#}

package() {
	DESTDIR="$pkgdir" meson install -C build
}
