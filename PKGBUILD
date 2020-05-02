# Maintainer: X0rg

pkgname=tumbler-extra-thumbnailers
pkgver=2
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
            '07e7abf95879bbb8d15644ad4db07f1b1818e0b01d358b1fb4657991e4873bfe64a3613934a6135af618d793f13178b659297fa182cc3d3aa0ff99ebca90fd99'
            'd98b04b51c31678afe4b9dd13d112fd417cfa84382e91ca3ac9113fcdb33b418649b93dbbc69277f901c18ff199f843cd062aa6127a31052e2c679539f99c8e8')

package() {
	for thumbnailer in *.thumbnailer; do
		install -Dvm644 "$thumbnailer" "$pkgdir/usr/share/thumbnailers/$thumbnailer"
	done

	for script in *.sh; do
		install -Dvm755 "$script" "$pkgdir/usr/bin/$(basename "$script" .sh)"
	done
}
