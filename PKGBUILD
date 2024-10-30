# Contributor: Mike Yuan <me@yhndnzj.com>
# Maintainer: Asuka Minato <i at asukaminato at eu dot org>
# Contributor: Aron Young <aronyang505 at gmail dot com>

pkgname=ast-grep-bin
pkgver=0.29.0
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
b2sums_x86_64=('50248f2d117313f2b41c819630e6f1eefdbf9baa60c8a5cea584b4c0c5d2b83a8f8905d42c15ae822bb3fd77d733d66c4c09ee0f633e55588e4ae22aec146b7d')
b2sums_aarch64=('3c9d0ef62c52832dfb30e4332cc2ff3ef7e67c254c21491f2e1d9d3bcbd590c7a63614b569fe0afca452b2b8708661448bec75d5ced76d44342b5bbfee84d58a')

package() {
	find $srcdir -name "sg" -type f -print -exec install -vDm755 {} "$pkgdir/usr/bin/ast-grep" \;
	install -vDm644 LICENSE -t $pkgdir/usr/share/licenses/$pkgname
}
