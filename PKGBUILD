# Contributor: Mike Yuan <me@yhndnzj.com>
# Maintainer: Asuka Minato <i at asukaminato at eu dot org>
# Contributor: Aron Young <aronyang505 at gmail dot com>

pkgname=ast-grep-bin
pkgver=0.34.3
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
b2sums_x86_64=('1dd3443a51479749f53e89847871f6cbebc65bf1262df493118bba4bffdda9732cef7be39aa58c6eabe583527a049e02158ce0b70d2a1c53b421f212cfc00964')
b2sums_aarch64=('8437e34e6e1e28f24ea4f8d90bedbcf34f368095b113e0e06fcb4ff0f150e514aae6fbb7783f19a3bbe07e80297af838ec02b978058d025d6aaf57c1388b7ed5')

package() {
	find $srcdir -name "sg" -type f -print -exec install -vDm755 {} "$pkgdir/usr/bin/ast-grep" \;
	install -vDm644 LICENSE -t $pkgdir/usr/share/licenses/$pkgname
}
