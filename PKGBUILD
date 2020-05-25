# Maintainer: Marius Lindvall <(firstname) {cat} varden {dog} info>

_version='4.1.20200524'
_sha256='78267afc1003bc02807a76f8cf881f869b7f797e1ad6575c7efab883adccc88d'

pkgname=codecept-bin
pkgver=${_version}
pkgrel=1
pkgdesc='The Codeception PHP testing framework (PHP 7 Phar version)'

url='https://codeception.com/'
arch=('any')
license=('MIT')

depends=('php>=7.2')
optdepends=()
conflicts=()
source=("codecept-$pkgver.phar::https://codeception.com/releases/${_version}/codecept.phar"
	"https://raw.githubusercontent.com/Codeception/Codeception/4.0/LICENSE")
sha256sums=("${_sha256}"
	"a170b2c91593ab8e55624afcd6b392d8df3e9e914105b1f1e9ea8b8b73aee16f")

package() {
	cd "$srcdir"
	install -Dm 755 "codecept-$pkgver.phar" "$pkgdir/usr/bin/codecept"
	install -Dm 644 "LICENSE" "$pkgdir/usr/share/licenses/codecept-bin/LICENSE"
}
