# Maintainer: ple <ple21108@gmail.com>
# Contributor: Atte Virtanen <aten.email@gmail.com>
pkgname=vrk-mpollux-digisign-client
pkgver=4.2.0_7923
pkgrel=1
epoch=1
pkgdesc="Client program for Finnish chip ID cards"
arch=('x86_64')
url="https://dvv.fi/linux-versiot"
license=('custom')
depends=('pcsclite' 'qt5-base')

_eevertti_id='85150294'
_extra_id='5a0a6c85-f5ac-868a-42a5-d866582b9c61'
source_x86_64=($pkgname-$pkgver.deb::"https://dvv.fi/documents/16079645/$_eevertti_id/mpollux-digisign-client-for-dvv_${pkgver//_/-}_amd64.deb/$_extra_id")

sha256sums_x86_64=('2ac8e24cc72d6cac15531844cf284fdd5695bd9fe4f6f964f7eea6897b086fcb')

backup=('etc/xdg/autostart/mpollux-digisign-client.desktop'
        'etc/xdg/Fujitsu/CCryptoLib.conf')

package() {
	tar xvfJ data.tar.xz -C "$pkgdir/"

	rmdir "$pkgdir/usr/sbin"
	mv "$pkgdir/usr/lib64" "$pkgdir/usr/lib"
	mv "$pkgdir/usr/share/doc/mpollux-digisign-client-for-vrk" "$pkgdir/usr/share/doc/$pkgname"
	install -Dt "$pkgdir/usr/share/licenses/$pkgname/" "$pkgdir/usr/share/doc/$pkgname/"{copyright,Legal_Notice_*.html}
	rm "$pkgdir/usr/share/doc/$pkgname/"{copyright,Legal_Notice_*.html}
}
