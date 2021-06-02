# Maintainer: ple <ple21108@gmail.com>
# Contributor: Atte Virtanen <aten.email@gmail.com>
pkgname=vrk-mpollux-digisign-client
pkgver=4.1.4_7851
pkgrel=3
epoch=1
pkgdesc="Client program for Finnish chip ID cards"
arch=('x86_64')
url="https://dvv.fi/linux-versiot"
license=('custom')
depends=('pcsclite' 'qt5-base')

_eevertti_id='54044386'
_extra_id='723f81de-f52c-4348-1c60-651f13cb57f5'
source_x86_64=($pkgname-$pkgver.deb::"https://dvv.fi/documents/16079645/$_eevertti_id/Ubuntu_18.04.4_LTS_mpollux-digisign-client-for-dvv_${pkgver//_/-}_amd64.deb/$_extra_id")

sha256sums_x86_64=('df37df0ca8cbf972f85e2b5a894784f76ffb84f0ac1d9638a90568a12bb776e7')

package() {
	tar xvfJ data.tar.xz -C "$pkgdir/"

	rmdir "$pkgdir/usr/sbin"
	mv "$pkgdir/usr/lib64" "$pkgdir/usr/lib"
	mv "$pkgdir/usr/share/doc/mpollux-digisign-client-for-vrk" "$pkgdir/usr/share/doc/$pkgname"
	install -Dt "$pkgdir/usr/share/licenses/$pkgname/" "$pkgdir/usr/share/doc/$pkgname/"{copyright,Legal_Notice_*.html}
	rm "$pkgdir/usr/share/doc/$pkgname/"{copyright,Legal_Notice_*.html}
}
