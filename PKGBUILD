# Maintainer: Lara Maia <lara@craft.net.br>

pkgname=wine-pixi2
url='https://www.digipen.edu/?id=1170&proj=26000'
pkgdesc='Digipen Sophomore Game - Final Version'
pkgver=2.0
pkgrel=2
arch=('any')
license=('Free to use and share')

source=('http://lara.craft.net.br/pixi-2.zip'
        'pixi2.desktop' 'pixi2.sh' 'LICENSE')
        
md5sums=('6dd1652d26df493aee13a7df3fdaf7c6'
         'e577c6fbd8e49132a823fc616c541227'
         '9e9d133b559ef4db4df4f31fd0127ae9'
         '779044cf14091cb2129e12d5c3e1725e')
         
depends=('wine' 'lib32-openal')


package() {
	cd "$scrdir"
	install -Dm755 pixi2.sh "$pkgdir"/usr/bin/pixi2/pixi2.sh
	install -Dm644 pixi2.desktop "$pkgdir"/usr/share/applications/pixi2.desktop
	install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/pixi2/LICENSE
	
	mkdir -p "$pkgdir"/usr/share/pixi2/
	cp -rf Pixi_Final/* "$pkgdir"/usr/share/pixi2/
}
