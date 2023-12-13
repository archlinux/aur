# Contributor: Mike Yuan <me@yhndnzj.com>
# Maintainer: Asuka Minato <i at asukaminato at eu dot org>
# Contributor: Aron Young <tkf6fkt at gmail dot com>

pkgname=ast-grep-bin
pkgver=0.14.4
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
b2sums_x86_64=('55cb0e791371d89a9896f9ab53a7517bc816667f03c530a083a3cfd180ce5b5c49eb25a6178dd540a4291af51c34744c4008b0dd382ff546d10ba99fbe250ef6')
b2sums_aarch64=('55cb0e791371d89a9896f9ab53a7517bc816667f03c530a083a3cfd180ce5b5c49eb25a6178dd540a4291af51c34744c4008b0dd382ff546d10ba99fbe250ef6')

package() {
	find $srcdir -name "sg" -type f -exec install -Dm755 {} "$pkgdir/usr/bin/ast-grep" \;
	install -Dm644 LICENSE -t $pkgdir/usr/share/licenses/$pkgname
}
