pkgname=yadmm
pkgver='0.2.0.beta'
pkgrel=1
pkgdesc="yet another diva mod manager: A Linux-focused Project DIVA Mega Mix+ mod manager."
arch=('x86_64')
url="https://github.com/okawaffles/yadmm"
license=("GNU GPLv3")
depends=('gtk3' 'nss' 'alsa-lib' 'libxss' 'libxtst')
source=("yadmm-${pkgver}.tar.gz::https://github.com/okawaffles/yadmm/releases/download/v${pkgver}/yadmm-${pkgver}.tar.xz")
options=('!strip')
sha256sums=('SKIP')

package() {
	cp -r "$srcdir/usr" "$pkgdir/"

	chmod 4755 "$pkgdir/usr/lib/yadmm/chrome-sandbox"
	chmod +x "$pkgdir/usr/lib/yadmm/yadmm"
	chmod +x "$pkgdir/usr/lib/yadmm/chrome_crashpad_handler"

	install -Dm644 "$srcdir/usr/share/doc/yadmm/copyright" \
		"$pkgdir/usr/share/licenses/$pkgdir/copyright"
}
