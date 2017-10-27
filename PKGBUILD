# Maintainer: Tomasz Gąsior <tomaszgasior.pl>

pkgname=canabalt
pkgver=0
pkgrel=1
pkgdesc='Side-scrolling endless runner flash game.'
arch=('i686' 'x86_64')
url='http://adamatomic.com/canabalt'
depends=('flashplayer-standalone' 'bash')
optdepends=('xdotool: automatically make game full screen, use alt+f4 to exit')
source=(
	"canabalt.swf::http://adamatomic.com/sw/f/Canabalt.swf"
	"canabalt.sh"
	"canabalt.png"
	"canabalt.desktop"
)
sha256sums=(
	"9ac99afbc2bbe7915845d330477078149f8b7df72f97d35c9807c617ff4b0d63"
	"effa9438539587b03974d1f7e812bbb9fefdf562039159fcd6214fc3157d0952"
	"24822372e99cf6dd51045993fd92cf4e31cc59dddf3b12b5359467de3232a4c2"
	"807b46ef0a7c934c874923754068edb6a2189ec41443548fdb9937594da3ddf4"
)

package() {
	mkdir -p "$pkgdir/opt/canabalt" "$pkgdir/usr/bin" "$pkgdir/usr/share/applications"

	cp "$srcdir/canabalt."{swf,sh,png} "$pkgdir/opt/canabalt"
	chmod +x "$pkgdir/opt/canabalt/canabalt.sh"

	ln -s "/opt/canabalt/canabalt.sh" "$pkgdir/usr/bin/canabalt"

	cp "$srcdir/canabalt.desktop" "$pkgdir/usr/share/applications"
	chmod +x "$pkgdir/usr/share/applications/canabalt.desktop"
}