# Maintainer: ple <ple21108@gmail.com>
# Contributor: Atte Virtanen <aten.email@gmail.com>
pkgname=vrk-mpollux-digisign-client
pkgver=4.2.2_8099
pkgrel=1
epoch=2
pkgdesc="Client program for Finnish chip ID cards"
arch=('x86_64')
url="https://dvv.fi/linux-versiot"
license=('custom')
depends=('pcsclite' 'qt5-base')

_eevertti_id='118383788'
source_x86_64=($pkgname-$pkgver.deb::"https://dvv.fi/documents/16079645/$_eevertti_id/mpollux-digisign-client-for-dvv_${pkgver//_/-}_amd64.deb")

sha256sums_x86_64=('97b182129744f3f52f3ef9d7947100774a1052fa01c0db78be8933cf35b5b8dc')

backup=('etc/xdg/autostart/mpollux-digisign-client.desktop'
        'etc/xdg/Fujitsu/CCryptoLib.conf')

package() {
	tar xvfJ data.tar.xz -C "$pkgdir/"

	rmdir "$pkgdir/usr/sbin"
	mv "$pkgdir/usr/lib64" "$pkgdir/usr/lib"
	mv "$pkgdir/usr/share/doc/mpollux-digisign-client-for-dvv" "$pkgdir/usr/share/doc/$pkgname"
}
