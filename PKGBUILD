# Maintainer: aps42 <arch@andre-sterba.de>
pkgname=waybar-issues
pkgver=0.3.1
pkgrel=1
pkgdesc='Get your open issues and merge/pull requests into waybar.'
arch=('x86_64')
url='https://github.com/andresterba/waybar-issues'
license=('MIT')
makedepends=('go')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/andresterba/waybar-issues/archive/v${pkgver}.tar.gz")
sha256sums=('9ba6a8b8cf47dfad9ca8b98df847278be4b2517455713c34909efda1361a9390')

build(){
  cd "$srcdir/$pkgname-$pkgver"
  go build -o waybar-issues
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm755 $pkgname "$pkgdir"/usr/bin/$pkgname
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

