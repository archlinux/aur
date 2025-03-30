pkgname=ccode
pkgver=1.0.4
pkgrel=1
pkgdesc="CLI tool to consolidate code files"
arch=('x86_64' 'aarch64')
url="https://github.com/x45iq/ccode"
license=('MIT')
depends=('glibc')
makedepends=('go' 'git')
source=("$pkgname-$pkgver.tar.gz::https://github.com/x45iq/ccode/archive/v$pkgver.tar.gz")
sha256sums=('7ddf42d96ec90b51add089bb6576d713faa4e5a1160907a733c4032c0436ef25')

build() {
  cd "$pkgname-$pkgver"
  go build -o ccode
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 ccode "$pkgdir/usr/bin/ccode"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
