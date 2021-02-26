# Maintainer: sihuan <sihuan at sakuya.love>
pkgname=instatus-out-bin
pkgver=1.0.6
pkgrel=1
pkgdesc="Monitor services in your menu bar"
arch=('x86_64')
url="https://instatus.com/out"
license=('MIT')
depends=('gtk3' 'nss')
source=("https://github.com/instatushq/out/releases/download/v${pkgver}/${pkgname}_${pkgver}_amd64.deb")
sha512sums=('c7afae493a8bf2242923f60df70bd4a8227cac86f2d130fb177a3b9361382872194376ff4a1cda724484346b461f8bef2fd73a5db68402b204be9ca3005d34cb')

prepare() {
	bsdtar -xf "$srcdir/data.tar.xz"
}

package() {
	cp -r "$srcdir/usr/" $pkgdir
	cp -r "$srcdir/opt/" $pkgdir
}
