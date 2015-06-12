# Maintainer: BlackICE (manfredi at gmail.com)

pkgname=wine-pixi
url='http://appdb.winehq.org/objectManager.php?sClass=version&iId=25412'
pkgdesc='Digipen Freshman Game - Showcase in IGF 2012'
pkgver=1.1
pkgrel=1
arch=('any')
license=('Free to use and share')

source=('http://www.wyrdysm.com/th15Stuf/Pixi_IGFv1.1.zip'
        'LICENSE' 'pixi.desktop' 'pixi.png' 'pixi.sh')
        
md5sums=('de1a08f317afcd9e8c101b0972de9656'
         '779044cf14091cb2129e12d5c3e1725e'
         '49ba015be435fe194b157f3b95ee4b46'
         '57b5aede1f007945194904475e129a97'
         '296fa5ef79e7a79d42a58f6c25569fda')
         
depends=('wine' 'lib32-openal' 'lib32-libpng' 'lib32-mpg123')


package() {
	cd "$scrdir"
	install -Dm755 pixi.sh "$pkgdir"/usr/bin/pixi
	install -Dm644 pixi.desktop "$pkgdir"/usr/share/applications/pixi.desktop
	install -Dm644 pixi.png "$pkgdir"/usr/share/pixi/pixi.png
	install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/pixi/LICENSE
	
	cp -rf Pixi_IGFv1.1/* "$pkgdir"/usr/share/pixi/	
}
