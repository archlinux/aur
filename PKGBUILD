# Maintainer: Henry Graham <henry)dot(arch)at(hgrahamcs)dot(com(>

pkgname=amimullvad
pkgver=1
pkgrel=1
pkgdesc='Utility to check for a mullvad vpn connection status'
arch=('x86_64')
url='https://github.com/hgrahamcs/amimullvad'
license=('custom:WTFPL')
makedepends=("cargo")
provides=(${pkgname})
source=('https://github.com/hgrahamcs/amimullvad/archive/v1.1.tar.gz')
sha256sums=('42b1699869f3733aa3506f0cb804d19b515fc64c020b2502a1245cd256637160')

prepare(){
	tar xvf v$pkgver.$pkgrel.tar.gz
}

build(){
	cd $pkgname-$pkgver.$pkgrel
	cargo build --release
}

package(){
	install -Dm644 "$pkgname-$pkgver.$pkgrel/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm755 "$pkgname-$pkgver.$pkgrel/target/release/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}
