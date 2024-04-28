# Maintainer: Balazs Mezei <mezei92@gmail.com>
pkgname=zmninja-bin
pkgver=1.7.7
_pkgver=1.7.007
pkgrel=1
pkgdesc="High performance, cross platform ionic app for Home/Commerical Security Surveillance using ZoneMinder or other NVRs"
arch=(x86_64)
options=(!strip)
url="https://github.com/ZoneMinder/zmNinja"
license=('GPL3' 'custom')
depends=()
_zmninja_file="zmninja-$pkgver-linux-$arch.AppImage"
source=("$url/releases/download/v$_pkgver/$_zmninja_file" "zmninja.desktop" "LICENSE" "zmninja.png")
sha256sums=('981982698cd0130063afc9774607e85bae69e1d5e3623c3002d9b6bd4071e32a'
            '1d904ca17553ce54a9c37ff9a6ec1f15f962a65a56191484e8c493384e33001a'
            'cad71380eaa58087318a10f960f3a7170308e39a0879a2c53a996339711d9fcd'
            '4e3490ae6e86aeb78893839727be5c145207ff1a083e3a3f2bc0163c057def4d')

build() {
	:
}


package() {
	cd $pkgdir
	install -d usr/lib/
	install -d usr/bin/
	ln -s  /usr/lib/$pkgname/$_zmninja_file usr/bin/$pkgname

	install -D -m755 $srcdir/$_zmninja_file usr/lib/$pkgname/$_zmninja_file
	install -D -m644 $srcdir/zmninja.desktop usr/share/applications/zmninja.desktop
	install -D -m644 $srcdir/LICENSE usr/share/licenses/$pkgname/LICENSE
	install -D -m644 $srcdir/zmninja.png usr/share/pixmaps/zmninja.png
}
