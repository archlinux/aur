# Contributor: Mike Yuan <me@yhndnzj.com>
# Maintainer: Asuka Minato <i at asukaminato at eu dot org>
# Co-Maintainer: Jason Barrow <barrow at jasonbarrow dot com>
# Contributor: Aron Young <aronyang505 at gmail dot com>

pkgname=ast-grep-bin
pkgver=0.41.1
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
sha256sums_x86_64=('f9b56d9fc3763c11a65b50a0f4ec0343b662f6ac6264850f531f04dec93ebd6d')
sha256sums_aarch64=('4eeb610bdf846f68e81b3c3b74c1a02d50057e95a5e890c871771046af3bcc91')
b2sums=('84489d87909510ed8ec39fb743c9e0983ba6a4bce03dd299cc41404d5f9050d1b08c3e28dbca3c81a1e958c5aa08aaeb8638b25a92e30ae14df8936e6c949d9c')
b2sums_x86_64=('5fae7e10198198408e0108cf8957087e4db0ffc9c03b5e059a1e01a2c855f33fb9fe90e79ccc56cdff1366bbb12b757ad76e4e9f693218861acc6dd20ae6c2f0')
b2sums_aarch64=('534cba127931c1e30edecf2e7fcf72fa33e47e81422d85a2ec5aa58786869e87e16a119f51f72cea2ee46ddbdf88294235eaf8c822161fbd5a20b5f51eec43c2')

package() {
  find $srcdir -name "ast-grep" -type f -print -exec install -vDm755 {} "$pkgdir/usr/bin/ast-grep" \;
  install -vDm644 LICENSE -t $pkgdir/usr/share/licenses/$pkgname
}
