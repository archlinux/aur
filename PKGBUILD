# Maintainer: KafCoppelia <k740677208@gmail.com>

pkgname=easycli-git
pkgver=0.1.32
pkgrel=1
pkgdesc="A desktop GUI from CLIProxyAPI"
arch=('x86_64')
license=('MIT')
url="https://github.com/router-for-me/EasyCLI"
depends=('glibc' 'openssl' 'gtk3' 'glib2' 'gdk-pixbuf2' 'cairo' 'webkit2gtk-4.1' 'libsoup3' 'hicolor-icon-theme')
conflicts=('easycli')
provides=('easycli')
source=("https://github.com/router-for-me/EasyCLI/releases/download/v${pkgver}/EasyCLI-v${pkgver}-linux-amd64.deb")
sha256sums=('5d8f1b5414dfb78ec181f4d656338e2f9200bb4a2b036915f96262654080e462')

prepare() {
    cd "${srcdir}"
    bsdtar -xf data.tar.gz -C ./
    rm -f data.tar.gz control.tar.gz debian-binary
}

package() {
    install -Dm755 "${srcdir}/usr/bin/easycli" "${pkgdir}/usr/bin/easycli"
    install -Dm644 "${srcdir}/usr/share/applications/EasyCLI.desktop" "${pkgdir}/usr/share/applications/EasyCLI.desktop"
    install -Dm644 "${srcdir}/usr/share/icons/hicolor/1024x1024/apps/easycli.png" "${pkgdir}/usr/share/icons/hicolor/1024x1024/apps/easycli.png"
    install -Dm644 "${srcdir}/usr/share/icons/hicolor/1024x1024/apps/easycli.png" "${pkgdir}/usr/share/pixmaps/easycli.png"
}
