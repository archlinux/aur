# Maintainer: fabillo <fabillo@archlinux.org>
pkgname="intiface-central-bin"
pkgver="3.0.0"
pkgrel=1
pkgdesc="Frontend application for the Buttplug Sex Toy Control Library"
arch=(x86_64)
url="https://github.com/intiface/intiface-central"
license=('GPL3')
depends=('gtk3' 'hicolor-icon-theme' 'bash')
provides=('intiface-central')
conflicts=('intiface-central')
source=(intiface_central.desktop
        run_intiface_central
        "$pkgname-$pkgver.zip::$url/releases/download/v$pkgver+36/intiface-central_v$pkgver-linux-ubuntu-22.04-x64.zip"
	"LICENSE.md::https://raw.githubusercontent.com/intiface/intiface-central/v$pkgver+36/LICENSE.md"
)
sha256sums=('SKIP'
            'SKIP'
	    'd1392c96ae3d9f018ed6eaa36ad3c1ac3fcc34d232a7c47188697b5440bfa8fe'
	    'SKIP'
)

package() {
	install -Dm755 "run_intiface_central" "$pkgdir/usr/lib/intiface_central/run_intiface_central"
	install -Dm644 "intiface_central.desktop" "$pkgdir/usr/share/applications/intiface_central.desktop"
	install -Dm644 "LICENSE.md" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"

	cd "intiface-central"
	install -Dm755 "intiface_central" "$pkgdir/usr/lib/intiface_central/intiface_central"
	cp -r "data" "$pkgdir/usr/lib/intiface_central/data"
	cp -r "lib" "$pkgdir/usr/lib/intiface_central/lib"
	install -Dm644 "data/flutter_assets/assets/icons/intiface_central_icon.png" "$pkgdir/usr/share/icons/hicolor/512x512/apps/intiface_central.png"
}
