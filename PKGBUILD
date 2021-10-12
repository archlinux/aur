# Maintainer: Julian Flake <flake at uni-koblenz dot de>
# Previous Maintainer: Thomas Jost <schnouki at schnouki dot net>

pkgname=pia-bin
pkgver=3.0.2
pkgrel=1
pkgdesc="A tool that aims to help data controllers build and demonstrate compliance to the GDPR. Developped by the French CNIL."
arch=('x86_64')
url="https://github.com/LINCnil/pia"
license=('GPL')
depends=('fuse' 'zlib')
options=('!strip')
source=("https://github.com/LINCnil/pia/releases/download/v${pkgver}/PIA-${pkgver}.AppImage"
        "pia-bin.png::https://github.com/LINCnil/pia/raw/master/src/assets/images/android-chrome-256x256.png"
	"pia-bin.desktop"
	"https://raw.githubusercontent.com/LINCnil/pia/master/LICENSE"
)
sha256sums=('9976cd82360da09d7795ed08e6481814049055f2b87bb1501ed92f12997dfda1'
            'c69048d3e53950378fa716b8845beab746323be33f480708067b13b53d78f7d8'
            'ddf3ff71ceb6be91af9b1856e593fa9bcba05d575beb20d1946d63dd7df51c9e'
	    '2aeed3ef570983e699930aa8f0192ce61628bd57d940e8461e94e286fbf01165'
	    )

package() {
  cd "$srcdir"
  install -Dm644 pia-bin.desktop "$pkgdir/usr/share/applications/pia-bin.desktop"
  install -Dm644 pia-bin.png "$pkgdir/usr/share/pixmaps/pia-bin.png"
  install -Dm755 "PIA-${pkgver}.AppImage" "$pkgdir/usr/bin/PIA"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/pia-bin/LICENSE"
}
