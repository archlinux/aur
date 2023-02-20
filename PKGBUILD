# Maintainer: Polarian <polarian@polarian.dev>
# Contributor: Holger Schramm <dev@strace.it>

pkgname=mingo
pkgver=1.11.0
pkgrel=2
pkgdesc="A proprietary MongoDB GUI based on electron from developers for developers"
arch=('x86_64')
url="https://mingo.io/"
license=('custom:mingo')
depends=('alsa-lib' 'at-spi2-core' 'cairo' 'desktop-file-utils' 'gdk-pixbuf2' 'gtk3' 'hicolor-icon-theme' 'libcups' 'libdrm' 'libx11' 'libxcb' 'libxcomposite' 'libxdamage' 'libxext' 'libxfixes' 'libxkbcommon' 'libxrandr' 'libxtst' 'mesa' 'pango')
options=('!strip' '!emptydirs')
install=${pkgname}.install
source=("mingo-$pkgver.tar.gz::https://github.com/mingo-app/mingo/releases/download/v$pkgver/mingo-$pkgver.tar.gz"
        "Mingo.desktop")
sha256sums=('75135d6b192080375a0e615c05827c50e620dd1ed582dfa731cb8b0a8480582e'
            '292ba3da6e1e99e3f7f1fa719dde92d1d12ab81cba8b772612f9a0647472df97')

package() {
	install -Dm644 "mingo-$pkgver/LICENSES.chromium.html" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "Mingo.desktop" "$pkgdir/usr/share/applications/Mingo.desktop"
  install -dm755 "$pkgdir/opt/mingo"
  cp -r "mingo-$pkgver"/* "$pkgdir/opt/mingo"
  chmod 655 -R "$pkgdir"/opt/mingo/*
}
