# Contributor: Mike Yuan <me@yhndnzj.com>
# Maintainer: Asuka Minato <asukaminato at nyan dot eu dot org>

pkgname=ast-grep-bin
pkgver=0.6.2
pkgrel=1
pkgdesc="A fast and easy tool for code searching, linting, rewriting at large scale"
arch=('x86_64')
url="https://github.com/ast-grep/ast-grep"
license=('MIT')
source=(https://raw.githubusercontent.com/ast-grep/ast-grep/c9aff6ace291c5a02e48446aa9be1d471b763ca2/LICENSE)
source_x86_64=("$pkgname-$pkgver.tar.gz::https://github.com/ast-grep/ast-grep/releases/download/$pkgver/sg-x86_64-unknown-linux-gnu.zip")
provides=(ast-grep)
depends=(gcc-libs glibc)
conflicts=(ast-grep)
b2sums=('84489d87909510ed8ec39fb743c9e0983ba6a4bce03dd299cc41404d5f9050d1b08c3e28dbca3c81a1e958c5aa08aaeb8638b25a92e30ae14df8936e6c949d9c')
b2sums_x86_64=('658e55423f430b87302cd251f29b3037ef06fda337fca4b2cb67d264e53c5186e36d8ff71387f5e6ce163ee163851136bcd15850cb37dc008be1f97d2c99ae94')
options=()

package() {
	find $srcdir -name "sg" -type f -exec install -Dm755 {} "$pkgdir/usr/bin/ast-grep" \;
	install -Dm644 LICENSE -t $pkgdir/usr/share/licenses/$pkgname
}
