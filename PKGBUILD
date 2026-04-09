# Maintainer: FrogSnot
_pkgauthor=FrogSnot
_pkgname=Sunder
pkgname=sunder-bin
pkgver=1.3.3
pkgrel=1
pkgdesc="A desktop YouTube music client that doesn't spy on you (prebuilt binary)"
arch=('x86_64')
url="https://github.com/${_pkgauthor}/${_pkgname}"
license=('AGPL-3.0-only')
depends=('glibc' 'gcc-libs' 'glib2' 'webkit2gtk-4.1' 'gtk3' 'gdk-pixbuf2' 'cairo'
         'libayatana-appindicator' 'librsvg' 'libsoup3' 'hicolor-icon-theme' 'yt-dlp' 'ffmpeg')
provides=('sunder')
conflicts=('sunder')
source=("LICENSE-$pkgver::https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/v${pkgver}/LICENSE"
        "README-$pkgver.md::https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/v${pkgver}/README.md"
        "${pkgname%-bin}_${pkgver}_amd64.deb::${url}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_amd64.deb")
sha256sums=('0d96a4ff68ad6d4b6f1f30f713b18d5184912ba8dd389f86aa7710db079abcb0' '46c44b26bf09b011d374d74246f8931d804a6fd76838b7821fd83956247f45cb' '9e40978733ea8c34d4a540495ba7375b042610e970e5b33a4fefbb762a7c39da')

package() {
    cd "$srcdir"

    tar -xzf data.tar.gz -C "$pkgdir"

    install -Dm644 "LICENSE-$pkgver" "$pkgdir/usr/share/licenses/${pkgname%-bin}/LICENSE"
    install -Dm644 "README-$pkgver.md" "$pkgdir/usr/share/doc/${pkgname%-bin}/README.md"
}
