# Maintainer: lanthora <lanthora at outlook dot com>
# Maintainer epsilonKNOT <epsilon.aur@epsilonKNOT.xyz>

pkgbase=uwebsockets
pkgname=uwebsockets
pkgver=20.60.0
pkgrel=1
pkgdesc="Simple, secure & standards compliant web server for the most demanding of applications"
url="https://github.com/uNetworking/uWebSockets"
license=('Apache')
arch=('x86_64')
source=("$pkgname-$pkgver.tar.gz::https://github.com/uNetworking/uWebSockets/archive/v$pkgver.tar.gz"
        "uwebsockets.pc")
sha256sums=('eb72223768f93d40038181653ee5b59a53736448a6ff4e8924fd56b2fcdc00db'
            '5433dee099ea6f6fe97ef200cc19aadc71ca5066d7f5238070c25cd040dfb520')
depends=( usockets )

package() {
	cd "$srcdir/uWebSockets-$pkgver"
	install -Dm644 -t "$pkgdir"/usr/include/uWebSockets/ src/*.h
	install -Dm644 "$srcdir"/uwebsockets.pc "$pkgdir"/usr/lib/pkgconfig/uwebsockets.pc
}

#vim: syntax=sh
