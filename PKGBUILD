# Maintainer: ple <ple21108@gmail.com>
# Contributor: Atte Virtanen <aten.email@gmail.com>
pkgname=vrk-mpollux-digisign-client
pkgver=4.1.4_7726
pkgrel=1
epoch=1
pkgdesc="Client program for Finnish chip ID cards"
arch=('x86_64')
url="https://dvv.fi/linux-versiot"
license=('custom')
depends=('pcsclite' 'qt5-base')

_eevertti_id='54044368'
source_x86_64=("https://dvv.fi/documents/16079645/$_eevertti_id/Ubuntu_mpollux-digisign-client-for-vrk_${pkgver//_/-}_amd64.deb")

sha256sums_x86_64=('ae846888a0d35c622381100757b79ccc6891f2b19dc9b80b1e29d47bcf69f604')

package() {
	tar xvfJ data.tar.xz -C "$pkgdir/"

	rmdir "$pkgdir/usr/sbin"
	mv "$pkgdir/usr/lib64" "$pkgdir/usr/lib"
	mv "$pkgdir/usr/share/doc/mpollux-digisign-client-for-vrk" "$pkgdir/usr/share/doc/$pkgname"
	install -Dt "$pkgdir/usr/share/licenses/$pkgname/" "$pkgdir/usr/share/doc/$pkgname/"{copyright,Legal_Notice_*.html}
	rm "$pkgdir/usr/share/doc/$pkgname/"{copyright,Legal_Notice_*.html}
}
