# Maintainer: ple <ple21108@gmail.com>
# Contributor: Atte Virtanen <aten.email@gmail.com>
pkgname=vrk-mpollux-digisign-client
pkgver=4.0.20_7205
pkgrel=1
pkgdesc="Client program for Finnish chip ID cards"
arch=('x86_64')
url="https://vrk.fi/linux-versiot"
license=('custom')
depends=('pcsclite' 'qt4')

_eevertti_id='14461784'
source_x86_64=("https://vrk.fi/documents/2252790/$_eevertti_id/Ubuntu_16.04.3_LTS_mpollux-digisign-client-for-vrk_${pkgver//_/-}_amd64.deb")

sha1sums_x86_64=('fbcfcf9367fdeb9751f6ae35db374dc3c32a4794')
sha256sums_x86_64=('003c846295d6684c577751ffa6af4f6e596a867be6e971e512f2d832ce8be45c')

package() {
	tar xvfJ data.tar.xz -C "$pkgdir/"

	rmdir "$pkgdir/usr/sbin"
	mv "$pkgdir/usr/lib64" "$pkgdir/usr/lib"
	mv "$pkgdir/usr/share/doc/mpollux-digisign-client-for-vrk" "$pkgdir/usr/share/doc/$pkgname"
	install -Dt "$pkgdir/usr/share/licenses/$pkgname/" "$pkgdir/usr/share/doc/$pkgname/"{copyright,Legal_Notice_*.html}

}

