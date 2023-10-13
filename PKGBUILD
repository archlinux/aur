# Contributor: Mike Yuan <me@yhndnzj.com>
# Maintainer: Asuka Minato <i at asukaminato at eu dot org>
# Contributor: Aron Young <tkf6fkt at gmail dot com>

pkgname=ast-grep-bin
pkgver=0.12.4
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
b2sums_x86_64=('d4fe7cd35bb8c3c1021014c407c25532ac6e3fd1b4d1344fc5f9942ce6ccf9ce8226bae1357a8c17f19a43b0b9cc56d8e445c3378b7db83a416adcbf645d0cb2')
b2sums_aarch64=('d4fe7cd35bb8c3c1021014c407c25532ac6e3fd1b4d1344fc5f9942ce6ccf9ce8226bae1357a8c17f19a43b0b9cc56d8e445c3378b7db83a416adcbf645d0cb2')

package() {
	find $srcdir -name "sg" -type f -exec install -Dm755 {} "$pkgdir/usr/bin/ast-grep" \;
	install -Dm644 LICENSE -t $pkgdir/usr/share/licenses/$pkgname
}
