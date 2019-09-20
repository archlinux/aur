# Maintainer: ple <ple21108@gmail.com>
# Contributor: Atte Virtanen <aten.email@gmail.com>
pkgname=vrk-mpollux-digisign-client
pkgver=4.0.20e_7247
pkgrel=1
epoch=1
pkgdesc="Client program for Finnish chip ID cards"
arch=('x86_64')
url="https://vrk.fi/linux-versiot"
license=('custom')
depends=('pcsclite' 'qt4')

_eevertti_id='15399194'
_uuid='179590f0-398c-5785-7115-d71566eb4848'
source_x86_64=("https://vrk.fi/documents/2252790/$_eevertti_id/Ubuntu_16.04.3_LTS_mpollux-digisign-client-for-vrk_${pkgver//_/-}_amd64.deb/$_uuid")

sha256sums_x86_64=('3b98c486075f55c70dbaac5b603919e336f85dcd1e652f3e6d5fd9ca807b4806')

package() {
	tar xvfJ data.tar.xz -C "$pkgdir/"

	rmdir "$pkgdir/usr/sbin"
	mv "$pkgdir/usr/lib64" "$pkgdir/usr/lib"
	mv "$pkgdir/usr/share/doc/mpollux-digisign-client-for-vrk" "$pkgdir/usr/share/doc/$pkgname"
	install -Dt "$pkgdir/usr/share/licenses/$pkgname/" "$pkgdir/usr/share/doc/$pkgname/"{copyright,Legal_Notice_*.html}

}
