# Maintainer: aps42 <arch@andre-sterba.de>
pkgname=waybar-issues
pkgver=0.3.3
pkgrel=1
pkgdesc='Get your open issues and merge/pull requests into waybar.'
arch=('x86_64')
url='https://github.com/andresterba/waybar-issues'
license=('MIT')
makedepends=('go')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/andresterba/waybar-issues/archive/v${pkgver}.tar.gz")
sha256sums=('300b213e163de492ba9ad9e895d8c335db7840830116754473ed297b19ed9fa3')

build(){
  cd "$srcdir/$pkgname-$pkgver"
  go build -o waybar-issues
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm755 $pkgname "$pkgdir"/usr/bin/$pkgname
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

