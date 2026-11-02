# Maintainer: nasedkinpv <nasedkinpv@users.noreply.github.com>
pkgname=numr-desktop-bin
pkgver=0.9.1
pkgrel=1
pkgdesc="Desktop app for the numr text calculator: variables, units, currencies, live rates"
arch=('x86_64' 'aarch64')
url="https://github.com/nasedkinpv/numr-desktop"
license=('MIT')
depends=('webkit2gtk-4.1' 'gtk3' 'libayatana-appindicator' 'librsvg' 'gcc-libs' 'glibc')
provides=('numr-desktop')
conflicts=('numr-desktop' 'numr-desktop-git')
source=("LICENSE-$pkgver::$url/raw/v$pkgver/LICENSE")
source_x86_64=("$pkgname-$pkgver-amd64.deb::$url/releases/download/v$pkgver/numr_${pkgver}_amd64.deb")
source_aarch64=("$pkgname-$pkgver-arm64.deb::$url/releases/download/v$pkgver/numr_${pkgver}_arm64.deb")
sha256sums=('SKIP')
sha256sums_x86_64=('4c2a35fc1141bd83a0ca190978eec20efa640d3a7e5f329eb3784c32be86d0d4')
sha256sums_aarch64=('d42c98922c18c2e76c73e9d8d898d3d2856f66a08d460b59f412b4c7d179d053')

package() {
    # makepkg already unpacked the .deb; data.tar.gz holds the file tree.
    bsdtar -xf data.tar.gz -C "$pkgdir"
    find "$pkgdir" -type d -exec chmod 755 {} +
    install -Dm644 "LICENSE-$pkgver" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
