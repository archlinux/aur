# Maintainer: Thorsten Foltz <thorsten.foltz@live.com>
pkgname=octa-bin
pkgver=0.14.2
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
sha256sums=('2a4b93827af06d72a7ca189179cf2ae60fbfe6769aea799f762a51ea26be6205')

package() {
    cd "octa-$pkgver-linux-x86_64"
    install -Dm755 "octa" "$pkgdir/usr/bin/octa"
    install -Dm644 "assets/octa.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/octa.svg"
    install -Dm644 "octa.desktop" "$pkgdir/usr/share/applications/octa.desktop"
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/octa/LICENSE"
    # The release tarball ships a pre-rendered man page (see release.yml).
    install -Dm644 "octa.1" "$pkgdir/usr/share/man/man1/octa.1"
}
