# Maintainer: sihuan <sihuan at sakuya.love>
_pkgname=instatus-out
pkgname=instatus-out-bin
pkgver=1.0.8
pkgrel=1
pkgdesc="Monitor services in your menu bar"
arch=('x86_64')
url="https://instatus.com/out"
license=('MIT')
depends=('gtk3' 'nss')
source=("https://github.com/instatushq/out/releases/download/v${pkgver}/${_pkgname}_${pkgver}_amd64.deb")
sha512sums=('379cd40108c1b08e8378ba3d2f4a744aee1eb2f2a6df75043f9298768620b2095270e644c39b172194d3deb6cc3cff166ca6b5f39817058d8b6b660a512bdf5f')

prepare() {
	bsdtar -xf "$srcdir/data.tar.xz"
}

package() {
	cp -r "$srcdir/usr/" $pkgdir
	cp -r "$srcdir/opt/" $pkgdir
}
