# Contributor: Mike Yuan <me@yhndnzj.com>
# Maintainer: Asuka Minato <i at asukaminato at eu dot org>
# Contributor: Aron Young <aronyang505 at gmail dot com>

pkgname=ast-grep-bin
pkgver=0.36.2
pkgrel=1
pkgdesc="A fast and easy tool for code searching, linting, rewriting at large scale"
arch=('x86_64' aarch64)
url="https://github.com/ast-grep/ast-grep"
license=('MIT')
source=(https://raw.githubusercontent.com/ast-grep/ast-grep/c9aff6ace291c5a02e48446aa9be1d471b763ca2/LICENSE)
source_x86_64=("$pkgname-$pkgver-x86_64.tar.gz::https://github.com/ast-grep/ast-grep/releases/download/$pkgver/app-x86_64-unknown-linux-gnu.zip")
source_aarch64=("$pkgname-$pkgver-aarch64.tar.gz::https://github.com/ast-grep/ast-grep/releases/download/$pkgver/app-aarch64-unknown-linux-gnu.zip")
provides=(ast-grep)
depends=(gcc-libs glibc)
conflicts=(ast-grep)
b2sums=('84489d87909510ed8ec39fb743c9e0983ba6a4bce03dd299cc41404d5f9050d1b08c3e28dbca3c81a1e958c5aa08aaeb8638b25a92e30ae14df8936e6c949d9c')
b2sums_x86_64=('c9c3bfc9b0ca8ac9c3bbfbbd7b2da77b47c519315026d5557b8e22b4e0f5a72e104f7eb32d3341151eb09d905ebae396aee824e38d46a56b8118ba98629ee0bf')
b2sums_aarch64=('e80d99ac67f17775dd8620f679c0066517d66f2c5168c240ed833663f394e830626c1346dbc58226d9473903a27fa4e4627733fbb479313578b9848ef6af4344')

package() {
	find $srcdir -name "sg" -type f -print -exec install -vDm755 {} "$pkgdir/usr/bin/ast-grep" \;
	install -vDm644 LICENSE -t $pkgdir/usr/share/licenses/$pkgname
}
