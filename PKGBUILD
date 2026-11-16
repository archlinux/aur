# Contributor: Mike Yuan <me@yhndnzj.com>
# Maintainer: Asuka Minato <i at asukaminato at eu dot org>
# Co-Maintainer: Jason Barrow <barrow at jasonbarrow dot com>
# Contributor: Aron Young <aronyang505 at gmail dot com>

pkgname=ast-grep-bin
pkgver=0.51.3
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
sha256sums_x86_64=('22803eb0c5bf83164fb7fd76d4721d355ecf0c8466ef47342c1ec7d80897ca47')
sha256sums_aarch64=('5b44fd68e78744934b359b07badce347d4197ed50b341d50f1f99d056ecedb08')
b2sums=('84489d87909510ed8ec39fb743c9e0983ba6a4bce03dd299cc41404d5f9050d1b08c3e28dbca3c81a1e958c5aa08aaeb8638b25a92e30ae14df8936e6c949d9c')
b2sums_x86_64=('bf1c5033130d910098da079d5109078dcd1538461523e164c6dbadd0bb36bf8d44011582905569e4e823c5e4e0213f3a027e685fb22cda27d31f6cf5b91c7dd6')
b2sums_aarch64=('275c121e8aa7ec247c1030fa67d23b2aa3bd9603566dbd937291e954c38b2c3b6eafc0690c929b856aeac716a63a0df22d12e4db07272a571d3d8ca1e564f94e')

package() {
  find "$srcdir" -name "ast-grep" -type f -print -exec install -vDm755 {} "$pkgdir/usr/bin/ast-grep" \;
  install -vDm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
