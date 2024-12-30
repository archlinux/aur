# Contributor: Mike Yuan <me@yhndnzj.com>
# Maintainer: Asuka Minato <i at asukaminato at eu dot org>
# Contributor: Aron Young <aronyang505 at gmail dot com>

pkgname=ast-grep-bin
pkgver=0.32.3
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
b2sums_x86_64=('b6fa1900325c7caf8fa2e60c8078ccb6dd9cf259e39bc891d12e3adc8efeba7e3b51240801cff04b20239023dc499890b714146ead77a352edd1ad82145c1c94')
b2sums_aarch64=('f10fd515b9c93bb4c5602d1759cd5ab04fe3d87d5fcc39700b7dbd5dc1f8037a92706593c2549d88c602218bbb4405c1f0f14ca39b1add572c2ef7d8a5d6937b')

package() {
	find $srcdir -name "sg" -type f -print -exec install -vDm755 {} "$pkgdir/usr/bin/ast-grep" \;
	install -vDm644 LICENSE -t $pkgdir/usr/share/licenses/$pkgname
}
