# Maintainer: Julien Virey <julien.virey@gmail.com>

pkgname=git-statuses-bin
pkgver=0.8.2
pkgrel=1
pkgdesc='A command-line tool to display the status of multiple Git repositories.'
arch=('x86_64')
options=(!lto)
url=https://github.com/bircni/git-statuses
_rawurl="${url/github.com/raw.githubusercontent.com}/refs/tags/$pkgver"
license=('MIT')
depends=(glibc gcc-libs libgit2)
makedepends=(cargo)
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")

source=(
  $pkgname-$pkgver-x86_64.tar.gz::$url/releases/download/$pkgver/${pkgname%-bin}-$pkgver-x86_64-unknown-linux-musl.tar.gz
  "LICENSE_$pkgver::$_rawurl/LICENSE"
)

sha256sums=('a42b809b4073f3abc0a6aed9ed629ef6cffc2354ecb7a6a3282712bf8c39a504'
            'cbe4e9b21763ba9a7cb13d61ca20026d7b8f1a92b9257d76b579639f44793e1a')

package() {
  install -Dm0755 -t "$pkgdir/usr/bin/" "${pkgname%-bin}"
  install -Dm644 LICENSE_$pkgver "${pkgdir}/usr/share/licenses/${pkgname%-bin}/LICENSE"
}
