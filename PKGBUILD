# Maintainer: Balazs Mezei <mezei92@gmail.com>
pkgname=zmninja
pkgver=1.7.4
_pkgver=1.7.004
pkgrel=1
pkgdesc="High performance, cross platform ionic app for Home/Commerical Security Surveillance using ZoneMinder or other NVRs"
arch=(x86_64)
options=(!strip)
url="https://github.com/ZoneMinder/zmNinja"
license=('GPL3' 'custom')
depends=()
_zmninja_file="zmninja-$pkgver-linux-$arch.AppImage"
source=("$url/releases/download/v$_pkgver/$_zmninja_file" "zmninja.desktop" "LICENSE" "zmninja.png")
sha256sums=('6cda19d3f901a32d650c66f40e066f5577adc80a0d990f6fb0a015fe97d331ff'
            '9f3663299da4be200b56e0d244ed4a9949435362906c607ac84083cb825a4102'
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
	install -D -m644 $srcdir/$pkgname.desktop usr/share/applications/$pkgname.desktop
	install -D -m644 $srcdir/LICENSE usr/share/licenses/$pkgname/LICENSE
	install -D -m644 $srcdir/zmninja.png usr/share/pixmaps/$pkgname.png
}
