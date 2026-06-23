# Maintainer: Thorsten Foltz <thorsten.foltz@live.com>
pkgname=octa-bin
pkgver=0.13.0
pkgrel=1
pkgdesc="Multi-format data viewer/editor supporting parquet, csv, json, avro, xlsx and more (pre-compiled)"
arch=('x86_64')
url="https://github.com/thorstenfoltz/octa"
license=('MIT')
depends=('gtk3' 'libxcb' 'libxkbcommon' 'openssl' 'fontconfig' 'freetype2' 'harfbuzz' 'fribidi')
provides=('octa')
conflicts=('octa')
options=(!debug)
source=("octa-$pkgver-linux-x86_64.tar.gz::$url/releases/download/$pkgver/octa-$pkgver-linux-x86_64.tar.gz")
sha256sums=('b077f3a45ef4355f8ab58688b5b55f6b55265f84004e0824f2bf1f42d6acb69b')

package() {
    cd "octa-$pkgver-linux-x86_64"
    install -Dm755 "octa" "$pkgdir/usr/bin/octa"
    install -Dm644 "assets/octa.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/octa.svg"
    install -Dm644 "octa.desktop" "$pkgdir/usr/share/applications/octa.desktop"
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/octa/LICENSE"
    # The release tarball ships a pre-rendered man page (see release.yml).
    install -Dm644 "octa.1" "$pkgdir/usr/share/man/man1/octa.1"
}
