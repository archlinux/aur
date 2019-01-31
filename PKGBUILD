# Maintainer: ple <ple21108@gmail.com>
# Contributor: Atte Virtanen <aten.email@gmail.com>
pkgname=vrk-mpollux-digisign-client
pkgver=4.0.18b_6995
pkgrel=1
pkgdesc="Client program for Finnish chip ID cards"
arch=('x86_64')
url="https://vrk.fi/linux-versiot"
license=('custom')
depends=('pcsclite' 'qt4')

_eevertti_id='11976406'
source_x86_64=("https://vrk.fi/documents/2252790/$_eevertti_id/Ubuntu_16.04.3_LTS_mpollux-digisign-client-for-vrk_${pkgver//_/-}_amd64.deb")

sha1sums_x86_64=('9929ea00b7c6a6d1793fae2fb0628f5c51c51a1b')
sha256sums_x86_64=('c40589c7d80556b74bf058ad0aca825b5369d8081be9815732026cc3389e7496')

package() {
	tar xvfJ data.tar.xz -C "$pkgdir/"

	rmdir "$pkgdir/usr/sbin"
	mv "$pkgdir/usr/lib64" "$pkgdir/usr/lib"
	mv "$pkgdir/usr/share/doc/mpollux-digisign-client-for-vrk" "$pkgdir/usr/share/doc/$pkgname"
	install -Dt "$pkgdir/usr/share/licenses/$pkgname/" "$pkgdir/usr/share/doc/$pkgname/"{copyright,Legal_Notice_*.html}

}
