# Contributor: Mike Yuan <me@yhndnzj.com>
# Maintainer: Asuka Minato <i at asukaminato at eu dot org>
# Contributor: Aron Young <tkf6fkt at gmail dot com>

pkgname=ast-grep-bin
pkgver=0.16.0
pkgrel=1
pkgdesc="A fast and easy tool for code searching, linting, rewriting at large scale"
arch=('x86_64' aarch64)
url="https://github.com/ast-grep/ast-grep"
license=('MIT')
source=(https://raw.githubusercontent.com/ast-grep/ast-grep/c9aff6ace291c5a02e48446aa9be1d471b763ca2/LICENSE)
source_x86_64=("$pkgname-$pkgver-x86_64.tar.gz::https://github.com/ast-grep/ast-grep/releases/download/$pkgver/sg-x86_64-unknown-linux-gnu.zip")
source_aarch64=("$pkgname-$pkgver-aarch64.tar.gz::https://github.com/ast-grep/ast-grep/releases/download/$pkgver/sg-aarch64-unknown-linux-gnu.zip")
provides=(ast-grep)
depends=(gcc-libs glibc)
conflicts=(ast-grep)
b2sums=('84489d87909510ed8ec39fb743c9e0983ba6a4bce03dd299cc41404d5f9050d1b08c3e28dbca3c81a1e958c5aa08aaeb8638b25a92e30ae14df8936e6c949d9c')
b2sums_x86_64=('ed8f7e88c85b0dac89c6257561aa02e2ff61ba1511464a33799ddc133215393b61f37ee485a6c6926c37c9ed59c5906be3b8f5edf416785584b4c6705b516707')
b2sums_aarch64=('45a2e25fc4761ac9cbbbde5180c75d586bc717835e7f5af593c11abe7dfed74a9680bf56b56b47dd85462e3b4a0be886e8e0e9e5db5e79d42fe1733f3c3fbac6')

package() {
	find $srcdir -name "sg" -type f -exec install -Dm755 {} "$pkgdir/usr/bin/ast-grep" \;
	install -Dm644 LICENSE -t $pkgdir/usr/share/licenses/$pkgname
}
