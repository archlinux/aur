# Maintainer:	M.Reynolds <blackboxnetworkproject@gmail.com>
# Contributor:	Antonio Rojas <arojas@archlinux.org>

pkgname="ttf-noto-fonts-simple"
pkgver="2017.01.12"
pkgrel=2
pkgdesc="Google Noto TTF fonts"
arch=(any)
url="https://www.google.com/get/noto/"
license=(custom:SIL)
provides=("ttf-font noto-fonts")
conflicts=("noto-fonts")
optdepends=('noto-fonts-cjk: CJK characters' 'noto-fonts-emoji: Emoji characters')
_commit=721e63c04fa8fb8b4d7c1c908e68e721317d8b53  # master
source=("noto-fonts-$_commit.tar.gz::https://github.com/googlei18n/noto-fonts/archive/$_commit.tar.gz")
sha256sums=('a36a76566381d6f2b72cf4831c3d052804beb63ad94fa3ff4a6cae3412a50202')

package() {
	
	cd noto-fonts-*/
	
	mkdir -p "$pkgdir"/usr/share/fonts/noto
	install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/noto-fonts/LICENSE
	
	# install -m644 unhinted/Noto*.tt[fc] "$pkgdir"/usr/share/fonts/noto
	# install -m644 hinted/Noto*.tt[fc] "$pkgdir"/usr/share/fonts/noto

	# install -m644 unhinted/NotoMono-*.tt[fc] "$pkgdir"/usr/share/fonts/noto
	install -m644 unhinted/NotoSans-*.ttf "$pkgdir"/usr/share/fonts/noto
	install -m644 unhinted/NotoSerif-*.ttf "$pkgdir"/usr/share/fonts/noto
	
	install -m644 hinted/NotoMono-*.ttf "$pkgdir"/usr/share/fonts/noto
	install -m644 hinted/NotoSans-*.ttf "$pkgdir"/usr/share/fonts/noto
	install -m644 hinted/NotoSerif-*.ttf "$pkgdir"/usr/share/fonts/noto
	
	# Already in NotoSans-*.ttc
	# rm "$pkgdir"/usr/share/fonts/noto/NotoSans{,UI}-*.ttf
}
