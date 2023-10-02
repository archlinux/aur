# Contributor: Mike Yuan <me@yhndnzj.com>
# Maintainer: Asuka Minato <i at asukaminato at eu dot org>
# Contributor: Aron Young <tkf6fkt at gmail dot com>

pkgname=ast-grep-bin
pkgver=0.12.2
pkgrel=1
pkgdesc="A fast and easy tool for code searching, linting, rewriting at large scale"
arch=('x86_64' aarch64)
url="https://github.com/ast-grep/ast-grep"
license=('MIT')
source=(https://raw.githubusercontent.com/ast-grep/ast-grep/c9aff6ace291c5a02e48446aa9be1d471b763ca2/LICENSE)
source_x86_64=("$pkgname-$pkgver.tar.gz::https://github.com/ast-grep/ast-grep/releases/download/$pkgver/sg-x86_64-unknown-linux-gnu.zip")
source_aarch64=("$pkgname-$pkgver.tar.gz::https://github.com/ast-grep/ast-grep/releases/download/$pkgver/sg-aarch64-unknown-linux-gnu.zip")
provides=(ast-grep)
depends=(gcc-libs glibc)
conflicts=(ast-grep)
b2sums=('84489d87909510ed8ec39fb743c9e0983ba6a4bce03dd299cc41404d5f9050d1b08c3e28dbca3c81a1e958c5aa08aaeb8638b25a92e30ae14df8936e6c949d9c')
b2sums_x86_64=('c01c27f6c2a16536ba10adb9da4198f9307a54ff4a0c55c50bf5f3bdd156aaf688a1c81ac5de0c88c132dcdfd7bbac5e06e324a51c25fd967f3d2440d68b8492')
b2sums_aarch64=('c01c27f6c2a16536ba10adb9da4198f9307a54ff4a0c55c50bf5f3bdd156aaf688a1c81ac5de0c88c132dcdfd7bbac5e06e324a51c25fd967f3d2440d68b8492')

package() {
	find $srcdir -name "sg" -type f -exec install -Dm755 {} "$pkgdir/usr/bin/ast-grep" \;
	install -Dm644 LICENSE -t $pkgdir/usr/share/licenses/$pkgname
}
