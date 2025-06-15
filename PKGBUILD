# Contributor: Mike Yuan <me@yhndnzj.com>
# Maintainer: Asuka Minato <i at asukaminato at eu dot org>
# Contributor: Aron Young <aronyang505 at gmail dot com>

pkgname=ast-grep-bin
pkgver=0.38.5
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
sha256sums_x86_64=('340a8dde2638648055100ea87442f42d5260d9dc24f06dbfba83bbe0c4932c5c')
sha256sums_aarch64=('4ad7781540aa9b98585b7a63221519a9945b0869fc147a3df7c8aa7a70b52e86')

package() {
	find $srcdir -name "ast-grep" -type f -print -exec install -vDm755 {} "$pkgdir/usr/bin/ast-grep" \;
	install -vDm644 LICENSE -t $pkgdir/usr/share/licenses/$pkgname
}
