pkgname=ccode
pkgver=1.0.3
pkgrel=1
pkgdesc="CLI tool to consolidate code files"
arch=('x86_64' 'aarch64')
url="https://github.com/x45iq/ccode"
license=('MIT')
depends=('glibc')
makedepends=('go' 'git')
source=("$pkgname-$pkgver.tar.gz::https://github.com/x45iq/ccode/archive/v$pkgver.tar.gz")
sha256sums=('8966afea3f6280efb856bae008cf07012ca78dde268d91bcbd4a2b797fee2b0a')

build() {
  cd "$pkgname-$pkgver"
  go build -o ccode ./cmd
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 ccode "$pkgdir/usr/bin/ccode"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
