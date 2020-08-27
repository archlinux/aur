# Maintainer: Parola Marco <mark.prl.97@gmail.com>
pkgname=ndd-git
pkgver=1.3
pkgrel=1
pkgdesc="A simple command-line number representation converter"
arch=('any')
url="https://github.com/Sonotsugipaa/ndd"
license=('MIT')
makedepends=('gcc' 'cmake')
source=('git+https://github.com/Sonotsugipaa/ndd.git')
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "%s" "$(git describe | sed 's/^v//' | sed 's/-/_/g')"
}

build() {
	cd "$srcdir/${pkgname%-git}"
	./build.sh -r release
}

package() {
	cd "$srcdir/${pkgname%-git}"
	mkdir "$pkgdir"/usr
	mkdir "$pkgdir"/usr/bin
	ln release/build/bin/ndd "$pkgdir"/usr/bin/ndd
}
