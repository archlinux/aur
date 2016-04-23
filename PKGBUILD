# Maintainer: Fernando Manfredi <contact at acidhub.click>
# Contributor: Lara Maia <lara@craft.net.br>

pkgname=wine-pixi2
url='http://games.digipen.edu/games/pixi'
pkgdesc='Digipen Sophomore Game - Final Version'
pkgver=2.0
pkgrel=3
arch=('any')
license=('Free to use and share')

source=('http://acidhub.click/downloads/pixi-2.zip'
        'pixi2.desktop' 'pixi2.sh' 'LICENSE')
        
sha256sums=('0af3adebfa8d905414681da4167156cab476017f7e7eecd6bef076fac7804bfc'
            '1df73c58999fbf4902b8ef280f8f622fa700c5a4ab8631b378392bd617a3379a'
            'ee187f4cac804123afa902d38d27399b6d3dc0e2e28882c18c25d618e11b8e3b'
            '27635d4ed7740d185172f475ef14891c888127640a0f6bd73356bc4e2062ce03')
         
depends=('wine' 'lib32-openal')

package() {
	cd "$scrdir"
	install -Dm755 pixi2.sh "$pkgdir"/usr/bin/pixi2/pixi2.sh
	install -Dm644 pixi2.desktop "$pkgdir"/usr/share/applications/pixi2.desktop
	install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/pixi2/LICENSE
	
	mkdir -p "$pkgdir"/usr/share/pixi2/
	cp -rf Pixi/* "$pkgdir"/usr/share/pixi2/
}
