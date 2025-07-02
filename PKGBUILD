# Maintainer: Ryan Chan <rycwo at posteo dot net>

pkgname=tmplgen
pkgver="0.1.1"
pkgrel=4
pkgdesc="Text template generator"
arch=("x86_64")
url="https://git.sr.ht/~rycwo/tmplgen"
license=(""custom:WTFPL"")
makedepends=("git" "go")
source=("https://git.sr.ht/~rycwo/tmplgen/archive/""$pkgver"".tar.gz")
sha256sums=('b83ecc8fae24963ad7604bf7533e3842c79617aca5184ca7c512d35eca7a9435')

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
