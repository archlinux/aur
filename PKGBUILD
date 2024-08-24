# Maintainer: UnicornDarkness

pkgname=tumbler-extra-thumbnailers
pkgver=4.2
pkgrel=1
pkgdesc="Customized thumbnailers for Tumbler"
arch=('any')
url="https://docs.xfce.org/xfce/tumbler/start"
license=('unknown')
depends=('imagemagick')
optdepends=('djvulibre: thumbnails for DjVu files')
provides=('tumbler-folder-thumbnailer' 'gnome-dds-thumbnailer')
conflicts=('tumbler-folder-thumbnailer' 'gnome-dds-thumbnailer')
source=('dds.thumbnailer'
	'djvu.thumbnailer'
	'folder-thumbnailer.sh'
	'folder.thumbnailer'
	'text-thumbnailer.sh'
	'text.thumbnailer'
	'webp.thumbnailer')
sha512sums=('c4f484f78b28d51e167d1e861c63c81aea623539fcaae7433d13b3fc8c0ccf5f9dbe5a760fcf3310490f1df3c31c1c1368e63d35604658dabe403216f9bf3e13'
            'd6b94fbee77935294a0fa8fd460bceb51db11bbf584c771d1f2055f0d87c900bdc494dba0519960bfad10058074623893609f40e2e2d60bc00bba6b5750f161d'
            'abd9689500eac4ffb5c1eabee009a02c8d94035380c24536b138df96a17263e1c14f6c593af34bfa38eb88f4079b83113d8aa518fc9828e22c10dd003a3c6dad'
            'e62c5407390861affdcaf5029f2d7c28d1e623d6361d37a28af0e36cd2dec5c3226d747c608b8b88c5e4deb00197d0d35656963ade5e3a160b0cc29bfcf31bac'
            '77c656894314fd260d5d6889327e1f451ed95073eecaee41d45e1ef219a11cc003f3d36541fb15584c9716434322df377288c1e3bb70bf1aa47f1c8e8329a260'
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
