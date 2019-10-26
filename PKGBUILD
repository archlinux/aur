# Maintainer: OriginCode <origincoder@yahoo.com>

pkgname=bilibili-live-helper-bin
_entryname="Bilibili Live Helper"
_srcname="弹幕库"
_pkgname=bilibili-live-helper
pkgver=2.1.1
pkgrel=1
pkgdesc="A Helper for Bilibili Live Broadcasting."
arch=('x86_64')
url="http://bilibili.danmaku.live/"
install=$_pkgname.install
license=('custom')
depends=('libxtst' 'gtk3' 'libxss' 'nss' 'alsa-lib')
conflicts=('bilibili-live-helper-git')
replaces=('bilibili-live-helper')
provides=('bilibili-live-helper')
source=("http://s2.danmaku.live/$_srcname-linux-v$pkgver.zip" "$_entryname.desktop" "$_pkgname.ico")
md5sums=('847a4a2fdf929f89064f4e80d48e8f70'
         '3c0afcc51f772ff4099530e8fd85c5c5'
         '4a7e1cd3ca1c588cf2a1be85e88ddce2')

build() {
	cd "$srcdir"
	mv "$_srcname-linux-x64" "$_pkgname"
	cd "$_pkgname"
	mv "$_srcname" "$_pkgname"
}

package() {
	install -Dd "$pkgdir/opt/$_pkgname"
	cp -r "$srcdir/$_pkgname"/* "$pkgdir/opt/$_pkgname"
	install -Dm755 ./"$_entryname.desktop" "$pkgdir/usr/share/applications/$_entryname.desktop"
	install -Dm444 ./"$_pkgname.ico" "$pkgdir/usr/share/icons/hicolor/128x128/$_pkgname.ico"
}
