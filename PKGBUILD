# Maintainer: sihuan <sihuan at sakuya.love>
_pkgname=instatus-out
pkgname=instatus-out-bin
pkgver=1.0.7
pkgrel=1
pkgdesc="Monitor services in your menu bar"
arch=('x86_64')
url="https://instatus.com/out"
license=('MIT')
depends=('gtk3' 'nss')
source=("https://github.com/instatushq/out/releases/download/v${pkgver}/${_pkgname}_${pkgver}_amd64.deb")
sha512sums=('9418cf5936b395091f45d738c4b1af8cec02c2a05e4b171d44179fb10457f888cb01b668e264c492bec377ed1056898bcc7bfd3069fa922191f1fabfaeef3d32')

prepare() {
	bsdtar -xf "$srcdir/data.tar.xz"
}

package() {
	cp -r "$srcdir/usr/" $pkgdir
	cp -r "$srcdir/opt/" $pkgdir
}
