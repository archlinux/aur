# Maintainer: Atte Virtanen <aten.email@gmail.com>
pkgname=vrk-mpollux-digisign-client
pkgver=4.0.10_5712
pkgrel=1
pkgdesc="Client program for Finnish chip ID cards"
arch=('i686' 'x86_64')
url="https://eevertti.vrk.fi/linux-versiot"
license=('custom')
depends=('pcsclite' 'qt4')

_eevertti_id='3572101'
source_i686=("https://eevertti.vrk.fi/documents/2634109/$_eevertti_id/Ubuntu_14.04.2_LTS_mpollux-digisign-client-for-vrk_${pkgver//_/-}_i386.deb")
source_x86_64=("https://eevertti.vrk.fi/documents/2634109/$_eevertti_id/Ubuntu_14.04.2_LTS_mpollux-digisign-client-for-vrk_${pkgver//_/-}_amd64.deb")

md5sums_i686=('a6c27e143e21edf5aafa2fcc27d83751')
md5sums_x86_64=('7ad66ab1247e33b88499324e89404c78')
sha1sums_i686=('4ac3104aca077df6b85a6d593b815629b1ddefcf')
sha1sums_x86_64=('1823fb0c4da856756c28b78a91760d6a14f90b8d')
sha256sums_i686=('120746dcd005d1fac5cd86b40745cd9b1d4b2a0fd0d6249f278cc94f8872f6a0')
sha256sums_x86_64=('10b2371a890c863be15643673c6766cc863910df8e9f1db2288eaa4755748960')
sha384sums_i686=('b55ffb16d138bbef6c509789cfab29d6f4b1f138da2549428795755f5e5d399bf2deb10c9d975bbbfa02bec8dfaf895d')
sha384sums_x86_64=('a5aa3af49b7d2055ca17e165bb288744d00a77fd5152e2feeb8e42869efc3d83b09698ce0446b67ffcd1b7f5a4d48b7f')
sha512sums_i686=('aec9b1695312d847ff24c95cee51553f2ac1a81f48c94481fbe3c2ac1defdd52ecc1d50c3e92e733344f5fd5914fe3b1763ec5e0b94493204849308e05522833')
sha512sums_x86_64=('1fbb80b1fe871bdc8819ed5f9123108309902d5be6023018ff8942f52db91db905a807c90f86d89463290b9733ea0b1746c8f844fae50d659fa9cf70241303d2')

package() {
	tar xvfJ data.tar.xz
	cp -r etc usr "$pkgdir/"

	rmdir "$pkgdir/usr/sbin"
	mv "$pkgdir/usr/lib64" "$pkgdir/usr/lib"
	mv "$pkgdir/usr/share/doc/mpollux-digisign-client-for-vrk" "$pkgdir/usr/share/doc/$pkgname"

	mkdir -p "$pkgdir/usr/share/licenses/$pkgname/"
	mv "$pkgdir/usr/share/doc/$pkgname/"{copyright,Legal_Notice_*.html} "$pkgdir/usr/share/licenses/$pkgname/"
}
