# Maintainer: Miguel Perez Andrade <miguel.perezandrade@gmail.com>

pkgname=smartedit-bin
_pkgname=smartedit
pkgver=0.0.2
pkgrel=1
pkgdesc="Enable AI agents to efficiently explore and edit source code, improving token efficiency, cost and speed"
arch=('x86_64')
url="https://github.com/theduke/smartedit"
license=('MIT')
depends=('gcc-libs' 'glibc')
provides=("$_pkgname")
conflicts=("$_pkgname")
options=('!debug')
_tag="smartedit-cli-v$pkgver"
source=("LICENSE-MIT-$pkgver::https://raw.githubusercontent.com/theduke/smartedit/$_tag/LICENSE-MIT")
source_x86_64=("$_pkgname-$pkgver-x86_64.tar.gz::$url/releases/download/$_tag/$_pkgname-x86_64-unknown-linux-gnu.tar.gz")
sha256sums=('4766a2fd614c999eba4965c7549531c301c830b5ff2d56c32bde490fa47cbb44')
sha256sums_x86_64=('0cdff4ec125f8e2f5da8064d4f4cc8f631ea98543bf7f27a0f56076c2508540f')

package() {
  install -Dm755 "$srcdir/$_pkgname" "$pkgdir/usr/bin/$_pkgname"
  install -Dm644 "$srcdir/LICENSE-MIT-$pkgver" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
