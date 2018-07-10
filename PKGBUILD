# Maintainer: ple <ple21108@gmail.com>
# Contributor: Atte Virtanen <aten.email@gmail.com>
pkgname=vrk-mpollux-digisign-client
pkgver=4.0.16_6640
pkgrel=1
pkgdesc="Client program for Finnish chip ID cards"
arch=('i686' 'x86_64')
url="https://eevertti.vrk.fi/linux-versiot"
license=('custom')
depends=('pcsclite' 'qt4')

_eevertti_id='8759527'
source_i686=("https://eevertti.vrk.fi/documents/2634109/$_eevertti_id/Ubuntu_16.04.3_LTS_mpollux-digisign-client-for-vrk_${pkgver//_/-}_i386.deb")
source_x86_64=("https://eevertti.vrk.fi/documents/2634109/$_eevertti_id/Ubuntu_16.04.3_LTS_mpollux-digisign-client-for-vrk_${pkgver//_/-}_amd64.deb")

sha1sums_i686=('199eed5149883bb07278269d18ec373dd756c754')
sha1sums_x86_64=('f881ce810a2f1ed500bc4d75498125113a9c2e33')
sha256sums_i686=('6328acad1a72e6faddd8a7902899f47512a882181d3290009fae48a1f65ec4e6')
sha256sums_x86_64=('6e8fe2011fd328afd8d931793e97eb3bf85a7f3d08d39bd9a30d5e4d4d7865fb')

package() {
	tar xvfJ data.tar.xz -C "$pkgdir/"

	rmdir "$pkgdir/usr/sbin"
	mv "$pkgdir/usr/lib64" "$pkgdir/usr/lib"
	mv "$pkgdir/usr/share/doc/mpollux-digisign-client-for-vrk" "$pkgdir/usr/share/doc/$pkgname"
	install -Dt "$pkgdir/usr/share/licenses/$pkgname/" "$pkgdir/usr/share/doc/$pkgname/"{copyright,Legal_Notice_*.html}

}
