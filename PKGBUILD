# Maintainer: Julian Flake <flake at uni-koblenz dot de>
# Previous Maintainer: Thomas Jost <schnouki at schnouki dot net>

pkgname=pia-bin
pkgver=2.2.1
pkgrel=1
pkgdesc="A tool that aims to help data controllers build and demonstrate compliance to the GDPR. Developped by the French CNIL."
arch=('x86_64')
url="https://github.com/LINCnil/pia-app"
license=('GPL')
depends=('fuse' 'zlib')
options=('!strip')
source=("https://github.com/LINCnil/pia-app/releases/download/v${pkgver}/PIA-${pkgver}.AppImage"
        "pia-bin.png::https://github.com/LINCnil/pia-app/raw/master/icons/128x128.png"
        "pia-bin.desktop"
	"https://raw.githubusercontent.com/LINCnil/pia-app/v${pkgver}/LICENSE"
)
sha256sums=('e30404744759b82fba6b95ba9f36f4b81d3928961c179de14d52cd8749895592'
            '70b5b9d4f58be2c3601aa06a9793e4e57067a644cc5c4c54605b73c652031330'
            'ddf3ff71ceb6be91af9b1856e593fa9bcba05d575beb20d1946d63dd7df51c9e'
	    '7dcfd26f67041962a7e1554b5ef3398d4faac0d543c20d4ae27ddc4b6d41ec8a'
	    )

package() {
  cd "$srcdir"
  install -Dm644 pia-bin.desktop "$pkgdir/usr/share/applications/pia-bin.desktop"
  install -Dm644 pia-bin.png "$pkgdir/usr/share/pixmaps/pia-bin.png"
  install -Dm755 "PIA-${pkgver}.AppImage" "$pkgdir/usr/bin/PIA"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/pia-bin/LICENSE"
}
