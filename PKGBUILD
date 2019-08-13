# Maintainer: Gaël PORTAY <gael.portay@gmail.com>

pkgname=dosh
pkgver=1.6
pkgrel=1
pkgdesc='Docker shell'
arch=('any')
url="https://github.com/gportay/$pkgname"
license=('MIT')
depends=('docker')
makedepends=('asciidoctor')
checkdepends=('shellcheck')
source=("https://github.com/gportay/$pkgname/archive/$pkgver.tar.gz")
md5sums=('33673c1fb370c691b75850cab671488e')

build() {
	cd "$pkgname-$pkgver"
	make doc
}

check() {
	cd "$pkgname-$pkgver"
	make -k check
}

package() {
	cd "$pkgname-$pkgver"
	install -D -m 755 dosh "$pkgdir/usr/bin/dosh"
	install -D -m 644 dosh.1.gz "$pkgdir/usr/share/man/man1/dosh.1.gz"
	install -D -m 644 bash-completion "$pkgdir/usr/share/bash-completion/completions/dosh"
	install -D -m 644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
