# Contributor: Mike Yuan <me@yhndnzj.com>
# Maintainer: Asuka Minato <i at asukaminato at eu dot org>
# Co-Maintainer: Jason Barrow <barrow at jasonbarrow dot com>
# Contributor: Aron Young <aronyang505 at gmail dot com>

pkgname=ast-grep-bin
pkgver=0.51.0
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
sha256sums=('81471889c77b2161a3e4dcdb1b2e6ca382e485766132d92d5fe1d7497e7dd2d9')
sha256sums_x86_64=('a7eead5552d3a8daad70f5d50d935da44bd0c138e946b5b0a96b1d38169fa639')
sha256sums_aarch64=('73af0ebe5958acee012754a5b2826a186580ef83333092408a7a01096fc30b8b')
b2sums=('84489d87909510ed8ec39fb743c9e0983ba6a4bce03dd299cc41404d5f9050d1b08c3e28dbca3c81a1e958c5aa08aaeb8638b25a92e30ae14df8936e6c949d9c')
b2sums_x86_64=('bb2fe8660600be29ae056c522d7a98104107b0b37dfdb9317112eb8ae788fb267ddfa9356b905d49d72bcc8283ec1935e5344e47cbc0232762692ddc8c8ed34c')
b2sums_aarch64=('1de85e1a7f1695256a3b48ca3f50c559e7427a498d5271c575c3a6f6b2f5f176e527a1ba09b79347da2d8145e34bee41af896568291b250cd5a43c3a1c74fba0')

package() {
  find "$srcdir" -name "ast-grep" -type f -print -exec install -vDm755 {} "$pkgdir/usr/bin/ast-grep" \;
  install -vDm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
