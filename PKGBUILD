# Maintainer: 305a385 <lotsof@shitposting.expert>


pkgname='ytfind-bin'
pkgver='1.4'
pkgrel=0
pkgdesc="A program that searches invidious and gives you video titles and IDs"
arch=('x86_64')
url='https://codeberg.org/305a385/ytfind/'
license=('AGPL3')
depends=('curl')
binname=('c09e598f-4335-4099-932a-a7d9110e6475')
manname=('01d37a81-18dc-4725-82bd-7afe86f6cd06')
source=("https://codeberg.org/attachments/$binname"
	"https://codeberg.org/attachments/$manname")
sha512sums=('df2b54ef15cadbae570ebf5d14ae940da465547e148f341da61d130af67b627e7339b621dc1e9625d21f68ba67a6c91a62a193e4244dda3d1415c34497387f4f'
	'2f2a406a964eda26e81c49ef317a3e7bcad673b74bb4ad5094857c041ebb4fa7341c367230b4380b5b4f7d0b6b9ae4ecc4860c1ce036855a44d7ec042b1d38c3')
noextract=('ytfind')
package() {
	mkdir -p "${pkgdir}/usr/bin"
	mkdir -p "${pkgdir}/usr/man/man1"

	install -m 755 ${srcdir}/${binname} ${pkgdir}/usr/bin/${pkgname//-bin/""}
	install -g 0 -o 0 -m 0644 ${srcdir}/${manname} ${pkgdir}/usr/man/man1/${pkgname//-bin/""}.1
	gzip ${pkgdir}/usr/man/man1/${pkgname//-bin/""}.1
}
