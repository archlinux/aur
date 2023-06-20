# Contributor: Mike Yuan <me@yhndnzj.com>
# Maintainer: Asuka Minato <i at asukaminato at eu dot org>

pkgname=ast-grep-bin
pkgver=0.6.6
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
b2sums_x86_64=('8bf0528087b219d88d0d288f7824073912f1862fe724213027013f970bd80a8ce2c9155ee8eeed1074a3b1bb16e3d1abf37ff8e7f10d4a97755dd8f50f8932f3')
options=()

package() {
	find $srcdir -name "sg" -type f -exec install -Dm755 {} "$pkgdir/usr/bin/ast-grep" \;
	install -Dm644 LICENSE -t $pkgdir/usr/share/licenses/$pkgname
}
