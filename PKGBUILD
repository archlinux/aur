# Maintainer: UnicornDarkness

pkgname=tumbler-extra-thumbnailers
pkgver=5.1
pkgrel=1
pkgdesc="Customized thumbnailers for Tumbler"
arch=('any')
url="https://docs.xfce.org/xfce/tumbler/available_plugins"
license=('unknown')
depends=('imagemagick')
optdepends=('comicthumb: thumbnails for comic book archives (cbr, cbz, cbt, cb7)'
	'djvulibre: thumbnails for DjVu files'
	'openscad: thumbnails for STL files')
provides=('tumbler-folder-thumbnailer' 'tumbler-stl-thumbnailer' 'gnome-dds-thumbnailer')
conflicts=('tumbler-folder-thumbnailer' 'tumbler-stl-thumbnailer' 'gnome-dds-thumbnailer')
source=('comicthumb.thumbnailer'
	'dds.thumbnailer'
	'dds.xml'
	'djvu.thumbnailer'
	'folder-thumbnailer.sh'
	'folder.thumbnailer'
	'stl-thumbnailer.sh'
	'stl.thumbnailer'
	'text-thumbnailer.sh'
	'text.thumbnailer'
	'webp.thumbnailer')
sha512sums=('e6983e977ead2bd46bf7509dbd2ecfeb0cbcc7782f8c9ff421aa93e5157b7709eb34aec05b336c4cfa3f46e093e02c5cea337a7ff5f9beff57b5e8cc1de9170e'
            'c4f484f78b28d51e167d1e861c63c81aea623539fcaae7433d13b3fc8c0ccf5f9dbe5a760fcf3310490f1df3c31c1c1368e63d35604658dabe403216f9bf3e13'
            '3590b2c8d6360b037f4b799e2ed77b67de9c172e56b068a73d31f4aa2e3161bae894080309f1cfd808bb00fc326062e33b35f9a9c87e4f6b78643658d00bc51c'
            'd6b94fbee77935294a0fa8fd460bceb51db11bbf584c771d1f2055f0d87c900bdc494dba0519960bfad10058074623893609f40e2e2d60bc00bba6b5750f161d'
            'abd9689500eac4ffb5c1eabee009a02c8d94035380c24536b138df96a17263e1c14f6c593af34bfa38eb88f4079b83113d8aa518fc9828e22c10dd003a3c6dad'
            'e62c5407390861affdcaf5029f2d7c28d1e623d6361d37a28af0e36cd2dec5c3226d747c608b8b88c5e4deb00197d0d35656963ade5e3a160b0cc29bfcf31bac'
            '3e5deb912bacfc5e9c724830e29cda554fce1e77e4d665fcd608cb5fd16a1e0fed9eb37c5f2ede9d619984fc81bd7df889f40939b527cd11b307a5e49cf78baf'
            '18f1196e6e320b8cf245587b27e61973380d4a93d2b225ce916edb564e0fe707aaefe0107de3d6037aaf6ad3d57ceecad8589138fa3be47ab350dc0b08b86d99'
            '36cdef0e9480a1667d0a09e46855a2740ca9c0488660e53b724a6fba7659719b47c89d1a4b08f6b9d393f91009a130242cef7a0f30c3f0aa874b70df92f13cd4'
            'd98b04b51c31678afe4b9dd13d112fd417cfa84382e91ca3ac9113fcdb33b418649b93dbbc69277f901c18ff199f843cd062aa6127a31052e2c679539f99c8e8'
            '01faadd6ff09eb60e723d0e84b5d6da5824c5702cb5285a4685ef299a95bcea13f5ae050def87890c87bad8b59152b3fc3e5c6ee9971ee90daf1102be83c21b2')

package() {
	for thumbnailer in *.thumbnailer; do
		install -Dvm644 "$thumbnailer" "$pkgdir/usr/share/thumbnailers/$thumbnailer"
	done

	for xml in *.xml; do
		install -Dvm644 "$xml" "$pkgdir/usr/share/mime/packages/$xml"
	done

	for script in *.sh; do
		install -Dvm755 "$script" "$pkgdir/usr/bin/$(basename "$script" .sh)"
	done
}
