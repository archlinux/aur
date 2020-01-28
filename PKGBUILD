# Maintainer: George Rawlinson <george@rawlinson.net.nz>
pkgname=efi-roller
pkgver=0.1
pkgrel=1
pkgdesc="simple script to help sign EFI images"
arch=(any)
url="https://github.com/Foxboron/efi-roller"
license=(MIT)
depends=(efitools openssl sbsigntools util-linux)
makedepends=(git asciidoc)
conflicts=("${pkgname}-git")
source=("$pkgname-$pkgver.tar.gz::https://github.com/Foxboron/$pkgname/archive/$pkgver.tar.gz")
sha512sums=('63baa2f0c07735a42167cf40902fbab76be80afc4d158224fbbcc2812490044d76644cc51f25365cffa394bb7435d6336447c0a11ed6d704b55e492a4cac3b28')

package() {
    cd "$srcdir/$pkgname-$pkgver"
    make PREFIX=usr DESTDIR="$pkgdir/" install
}
