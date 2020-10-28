# Maintainer: aps42 <arch@andre-sterba.de>
pkgname=waybar-issues
pkgver=0.3.0
pkgrel=1
pkgdesc='Get your open issues and merge/pull requests into waybar.'
arch=('x86_64')
url='https://github.com/andresterba/waybar-issues'
license=('MIT')
makedepends=('go')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/andresterba/waybar-issues/archive/v${pkgver}.tar.gz")
sha256sums=('5dbf039d232dd9d577321cac0c3c30253a6d1e28c10a0b9f6c652f70400b26c2')

build(){
  cd "$srcdir/$pkgname-$pkgver"
  go build -o waybar-issues
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm755 $pkgname "$pkgdir"/usr/bin/$pkgname
}