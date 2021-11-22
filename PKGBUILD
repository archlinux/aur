# Maintainer: Ryan Chan <rycwo at posteo dot net>

pkgname=tmplgen
pkgver="0.1.1"
pkgrel=3
pkgdesc="Basic text template generator"
arch=("x86_64")
url="https://git.sr.ht/~rycwo/tmplgen"
license=(""custom:WTFPL"")
makedepends=("git" "go")
source=("https://git.sr.ht/~rycwo/tmplgen/archive/""$pkgver"".tar.gz")
sha256sums=('1ed8ba57316431ecf4ece6cac09c387aca7c70b04d9c996181eaaf9357ae19b8')

build() {
	cd "$srcdir""/tmplgen-""$pkgver"
	go build -ldflags "-s -w -X main.version=""$pkgver"
}

package() {
	cd "$srcdir""/tmplgen-""$pkgver"
	mkdir -p "$pkgdir""/usr/bin"
	install -m775 tmplgen "$pkgdir""/usr/bin/tmplgen"
	mkdir -p "$pkgdir""/usr/share/licenses/tmplgen"
	install -m644 LICENSE "$pkgdir""/usr/share/licenses/tmplgen/LICENSE"
}
