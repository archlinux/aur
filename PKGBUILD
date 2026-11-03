# Maintainer: nasedkinpv <nasedkinpv@users.noreply.github.com>
pkgname=numr-desktop-bin
pkgver=0.9.3
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
sha256sums_x86_64=('e347bb01177ff8bae77f1a1b0acdc800e279388e6ba1bf4f28a260996fd654dc')
sha256sums_aarch64=('4587141aa801a912f9b537770bfc307658d5e9a9fd640485a5dd5c196f22655c')

package() {
    # makepkg already unpacked the .deb; data.tar.gz holds the file tree.
    bsdtar -xf data.tar.gz -C "$pkgdir"
    find "$pkgdir" -type d -exec chmod 755 {} +
    install -Dm644 "LICENSE-$pkgver" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
