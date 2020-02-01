# Maintainer: X0rg

pkgname=tumbler-extra-thumbnailers
pkgver=1
pkgrel=1
pkgdesc="Customized thumbnailers for Tumbler"
arch=('any')
url="https://docs.xfce.org/xfce/thunar/tumbler"
depends=('imagemagick')
source=('dds.thumbnailer'
	'folder-thumbnailer.sh'
	'folder.thumbnailer'
	'text-thumbnailer.sh'
	'text.thumbnailer'
)
sha512sums=('c4f484f78b28d51e167d1e861c63c81aea623539fcaae7433d13b3fc8c0ccf5f9dbe5a760fcf3310490f1df3c31c1c1368e63d35604658dabe403216f9bf3e13'
            '3f3ebb4675f41fec82239b5c782d86162a99f92b37c6274ece459b4d2e53f0133606ebfbbac7dbed8e12d9c91590eb667116f6d71449f12e231517d75fe41141'
            'e62c5407390861affdcaf5029f2d7c28d1e623d6361d37a28af0e36cd2dec5c3226d747c608b8b88c5e4deb00197d0d35656963ade5e3a160b0cc29bfcf31bac'
            'f69d116ae4200b1be66b4bb0795b01aca9a161f9051ca6f10739e931787a0bc876b8aa456a3d307c2aedca6484f3f97298fe7fcd8eee1bfbe576f9c5694c5aab'
            'ccb6b385bf72f342690ef08b11445dfc18cd6967fe8b2136615560d2386d708988ec36618d9741656ee81d1d9152e4ca2a8df66901e5499a892ecde65d1a0782')

package() {
	for thumbnailer in *.thumbnailer; do
		install -Dvm644 "$thumbnailer" "$pkgdir/usr/share/thumbnailers/$thumbnailer"
	done

	for script in *.sh; do
		install -Dvm755 "$script" "$pkgdir/usr/bin/$(basename "$script" .sh)"
	done
}
