# Maintainer: xklo <xklo protonmail ch>
pkgname=zoomx
pkgver=0.0.1
pkgrel=1
pkgdesc="Screen magnifying zoom utility for X11"
arch=('any')
url="https://github.com/boom-roasted/zoomx"
license=('MIT')
depends=(glibc libx11)
source=("$pkgname-$pkgver.tar.gz::https://github.com/boom-roasted/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('6166582f64da65dd6f12c2b371b7566c095a1ad21470a50ffb783acf43cfbab9')

build() {
    cd "$pkgname-$pkgver"
	gcc -g zoomx.c -L/usr/X11R6/lib -lX11 -o zoomx
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm751 zoomx "$pkgdir/usr/bin/zoomx"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
