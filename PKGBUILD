# Maintainer: not_anonymous <nmlibertarian@gmail.com>

pkgname=kx2utility
_pkgname=KX2UtilityLINUX64BIT
pkgver=1_23_4_23
pkgrel=1
pkgdesc="Elecraft Factory APP for use with the KX2 Ham Radio."
arch=('x86_64')
url="https://ftp.elecraft.com/KX2/Manuals%20Downloads/"
license=('custom:ELECRAFT')
depends=('gcc-libs' 'gtk2' 'curl' 'hamradio-menus')
options=('!strip')
source=(https://ftp.elecraft.com/KX2/Utilities/${_pkgname}_$pkgver.tar.gz
	$pkgname.1
	$pkgname.desktop)

package() {
	cd $srcdir/${_pkgname}_$pkgver

	install -d $pkgdir/usr/share/$pkgname
	cp -a * $pkgdir/usr/share/$pkgname

	mkdir -p $pkgdir/usr/bin
	install -D -m 755 ../$pkgname.1 $pkgdir/usr/bin/$pkgname

	mkdir -p $pkgdir/usr/share/{applications,pixmaps,licenses/$pkgname}
	install -D -m 644 Help/License.rtf $pkgdir/usr/share/licenses/$pkgname
	install -D -m 644 Resources/icon-48.png $pkgdir/usr/share/pixmaps/kx2utility.png
	install -D -m 644 ../$pkgname.desktop $pkgdir/usr/share/applications
}
md5sums=('fc5cd97a4c49fae374c36f0c95aeb47f'
         '8be8f31caf2b8f86886aa4725b2d3373'
         'a8a0ffdaa2fd7d4a3c49d36bc455a780')
sha256sums=('69303f9bb98f4fa22253e45accd263cfdf91155fc33b1ec2d621156c0eefbede'
            'db6b32d842cf1703c750c6460443199acae7a1ff45086b48c24204cce84a9950'
            '14e5808ce76e134e6a8da87cd81e5181c6fc75f7904d973dcff9e993c45f160d')
