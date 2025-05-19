# Maintainer: Nils Orbat <nils@orbat.sh>
pkgname='sleep-on-lan'
pkgver='1.1.1'
pkgrel='1'
pkgdesc="Multi-platform process allowing to sleep on LAN a linux or windows computer, through wake-on-lan (reversed) magic packets or through HTTP REST requests."
arch=('x86_64' 'aarch64')
url="https://github.com/SR-G/sleep-on-lan"
license=('Apache')
depends=('glibc')
makedepends=('go')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/SR-G/${pkgname}/archive/refs/tags/${pkgver}-RELEASE.tar.gz")
noextract=()
md5sums=('23d0caf14631f16da01cb44a3a9cc0e7')

build() {
	cd "$srcdir/$pkgname-$pkgver-RELEASE/src"
	go build ./...
}

package() {
	cd "$srcdir/$pkgname-$pkgver-RELEASE"
	install -Dm 755 src/$pkgname "$pkgdir/usr/bin/$pkgname"
}
