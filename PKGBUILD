# Maintainer: Marko Korhonen <aur@marko.korhonen.cc>
pkgname="lqsd-bin"
pkgdesc="LiQuid Screen Dim - Dim your screen smoothly. Precompiled binary version"
pkgver=0.1.1
pkgrel=2
arch=('x86_64')
url="https://github.com/FunctionalHacker/lqsd"
license=('MIT')
depends=('light')
provides=('lqsd')
conflicts=('lqsd')
source=("${pkgname/-bin/}_${pkgver}_${arch}.tar.zst::https://github.com/ReekyMarko/lqsd/releases/download/v${pkgver}/${pkgname/-bin/}_${pkgver}_${arch}.tar.zst")
sha256sums=('6e66fef446e84b8322957bc5abcb09bbd6ae8caface6d28a4ac4c82172a82d16')

package() {
	install -D -m755 "${pkgname/-bin/}" "$pkgdir/usr/bin/${pkgname/-bin/}"
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/${pkgname/-bin/}"
	install -Dm644 ${pkgname/-bin/}.1 "$pkgdir/usr/share/man/man1/${pkgname/-bin/}.1"
}
