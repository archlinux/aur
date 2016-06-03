# Maintainer: Atte Virtanen <aten.email@gmail.com>
pkgname=vrk-mpollux-digisign-client
pkgver=4.0.4_5355
pkgrel=1
pkgdesc="Client program for Finnish chip ID cards"
arch=('i686' 'x86_64')
url="https://eevertti.vrk.fi/Default.aspx?id=308"
license=('custom')
depends=('pcsclite' 'qt4')

source_i686=("Ubuntu_14.04.2_LTS_mpollux-digisign-client-for-vrk_${pkgver//_/-}_i386.deb::https://eevertti.vrk.fi/Default.aspx?id=0&docid=1284&action=Publish")
source_x86_64=("Ubuntu_14.04.2_LTS_mpollux-digisign-client-for-vrk_${pkgver//_/-}_amd64.deb::https://eevertti.vrk.fi/Default.aspx?id=0&docid=1283&action=Publish")

md5sums_i686=('b0a12c12eea3c7bd8765ab98665d485a')
md5sums_x86_64=('e5ee6f58990516b5eb56c827cdefc85f')
sha1sums_i686=('b904ea5a7cbbbb554917244f41751850c1edf8bb')
sha1sums_x86_64=('14bd43f577d85bee4ed34eaf2895987d279eb4f0')
sha256sums_i686=('d9a02f05308ed03d97f40b87eac884261dff55ac9ddf237deaf960e1906b2d10')
sha256sums_x86_64=('7b7191389e3268bfbc0f15944ab05cc94e0371cc7b253b237c2e1f7fff746d13')
sha384sums_i686=('23b66d8e7b460a0252266638bd9a740bf3ea59f7679adcd78981fd8f26ed0f46677d30b812a39145db3cbffad21f6dd8')
sha384sums_x86_64=('e898e2e7a577cc522e09b61f1c6f0d795090b5a0a9bc4189d9dc8139ccac931e0a2b75ce69352cfeae11fa91d532d2d3')
sha512sums_i686=('11f4db46b18f6e9b2640f2b7c8a54df050a4c6882afe420910341350e86cc856bce67d32c5f92eaddc01e6df4ef59102e9f516d77216cf49c3abe3a3c7591fa2')
sha512sums_x86_64=('c88399aec3690916f0b91065369fc0163b86f35c4f42f74c87c61cc5aa4386c8e408dc31fe15f26cbcb46536f7ed6f3f211643166af7e087bc1bc6d40a1ac996')

package() {
	tar xvfJ data.tar.xz
	cp -r etc usr "$pkgdir/"

	rmdir "$pkgdir/usr/sbin"
	mv "$pkgdir/usr/lib64" "$pkgdir/usr/lib"
	mv "$pkgdir/usr/share/doc/mpollux-digisign-client-for-vrk" "$pkgdir/usr/share/doc/$pkgname"

	mkdir -p "$pkgdir/usr/share/licenses/$pkgname/"
	mv "$pkgdir/usr/share/doc/$pkgname/"{copyright,Legal_Notice_*.html} "$pkgdir/usr/share/licenses/$pkgname/"
}
