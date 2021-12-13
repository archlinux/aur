# Maintainer: X0rg

pkgname=tumbler-extra-thumbnailers
pkgver=4.1
pkgrel=3
pkgdesc="Customized thumbnailers for Tumbler"
arch=('any')
url="https://docs.xfce.org/xfce/tumbler/start"
license=('unknown')
depends=('imagemagick')
optdepends=('djvulibre: thumbnails for DjVu files')
source=('dds.thumbnailer'
	'djvu.thumbnailer'
	'folder-thumbnailer.sh'
	'folder.thumbnailer'
	'text-thumbnailer.sh'
	'text.thumbnailer'
	'webp.thumbnailer')
sha512sums=('c4f484f78b28d51e167d1e861c63c81aea623539fcaae7433d13b3fc8c0ccf5f9dbe5a760fcf3310490f1df3c31c1c1368e63d35604658dabe403216f9bf3e13'
            'd6b94fbee77935294a0fa8fd460bceb51db11bbf584c771d1f2055f0d87c900bdc494dba0519960bfad10058074623893609f40e2e2d60bc00bba6b5750f161d'
            '3f3ebb4675f41fec82239b5c782d86162a99f92b37c6274ece459b4d2e53f0133606ebfbbac7dbed8e12d9c91590eb667116f6d71449f12e231517d75fe41141'
            'e62c5407390861affdcaf5029f2d7c28d1e623d6361d37a28af0e36cd2dec5c3226d747c608b8b88c5e4deb00197d0d35656963ade5e3a160b0cc29bfcf31bac'
            '88b64e45ba9daedf373559b10d2cb653ae1a08b7a56a0c5ec51ecf7652b820a4f7feebd9615019fd3f93094636e7e4d0a2c1be71b2150e732ae05867bd77b3a6'
            'd98b04b51c31678afe4b9dd13d112fd417cfa84382e91ca3ac9113fcdb33b418649b93dbbc69277f901c18ff199f843cd062aa6127a31052e2c679539f99c8e8'
            '01faadd6ff09eb60e723d0e84b5d6da5824c5702cb5285a4685ef299a95bcea13f5ae050def87890c87bad8b59152b3fc3e5c6ee9971ee90daf1102be83c21b2')

package() {
	for thumbnailer in *.thumbnailer; do
		install -Dvm644 "$thumbnailer" "$pkgdir/usr/share/thumbnailers/$thumbnailer"
	done

	for script in *.sh; do
		install -Dvm755 "$script" "$pkgdir/usr/bin/$(basename "$script" .sh)"
	done
}
