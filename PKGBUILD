# Maintainer: Tommy Jerry Mairo <tjm@member.fsf.org>
pkgname=ghidra-fidb-repo
pkgver=20200530
pkgrel=4
pkgdesc="Ghidra Function ID dataset repository"
arch=("any")
url="https://github.com/threatrack/ghidra-fidb-repo"
license=('MIT')
optdepends=("ghidra")
source=("$pkgname-$pkgver.tar.gz::https://github.com/threatrack/$pkgname/archive/refs/tags/$pkgver.tar.gz")
sha256sums=("fa8987b329232de6d03fc79d85cd2ab48933ca791e73b582ca041f6567ff2932")

package() {
	mkdir -p "$pkgdir/opt/ghidra/Ghidra/Features/FunctionID/data/$pkgname"
	cd 
	find "$srcdir/$pkgname-$pkgver" -type f -name '*.fidb' -exec \
	install -m 444 {} "$pkgdir/opt/ghidra/Ghidra/Features/FunctionID/data/$pkgname" \;
}
