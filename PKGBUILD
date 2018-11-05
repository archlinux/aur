# Maintainer: ple <ple21108@gmail.com>
# Contributor: Atte Virtanen <aten.email@gmail.com>
pkgname=vrk-mpollux-digisign-client
pkgver=4.0.18_6859
pkgrel=1
pkgdesc="Client program for Finnish chip ID cards"
arch=('x86_64')
url="https://vrk.fi/linux-versiot"
license=('custom')
depends=('pcsclite' 'qt4')

_eevertti_id='10764250'
source_x86_64=("https://vrk.fi/documents/2252790/$_eevertti_id/Ubuntu_16.04.3_LTS_mpollux-digisign-client-for-vrk_${pkgver//_/-}_amd64.deb")

sha1sums_x86_64=('70254994fd92542b570f2dddb782e7e251c1f5c6')
sha256sums_x86_64=('46066c38fcf4545d649a1bffdf52831a943667a09224ecb224f019e77c518da8')

package() {
	tar xvfJ data.tar.xz -C "$pkgdir/"

	rmdir "$pkgdir/usr/sbin"
	mv "$pkgdir/usr/lib64" "$pkgdir/usr/lib"
	mv "$pkgdir/usr/share/doc/mpollux-digisign-client-for-vrk" "$pkgdir/usr/share/doc/$pkgname"
	install -Dt "$pkgdir/usr/share/licenses/$pkgname/" "$pkgdir/usr/share/doc/$pkgname/"{copyright,Legal_Notice_*.html}

}
