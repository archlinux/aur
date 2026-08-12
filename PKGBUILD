# Maintainer: petrouil
pkgname=pastemax
pkgver=1.1.1
pkgrel=2
pkgdesc='A simple tool to select files from a repository to copy/paste into an LLM'
arch=('x86_64')
url='https://github.com/kleneway/pastemax'
license=('MIT')
depends=('alsa-lib' 'gtk3' 'libxss' 'nss' 'libnotify' 'xdg-utils')
makedepends=('dpkg')
options=('!strip')
source=("${pkgname}_${pkgver}-stable_amd64.deb::https://github.com/kleneway/pastemax/releases/download/v${pkgver}-stable/${pkgname}_${pkgver}-stable_amd64.deb")
sha256sums=('a85a694a903733ccbd5f591b27994eaf9573603c341a827929e96333d8911c5e')

prepare() {
    dpkg-deb -x "${pkgname}_${pkgver}-stable_amd64.deb" "${srcdir}/deb"
}

package() {
    cp -a "${srcdir}/deb/." "${pkgdir}/"
    install -Dm644 "${srcdir}/deb/usr/share/icons/hicolor/1024x1024/apps/pastemax.png" \
        "${pkgdir}/usr/share/icons/hicolor/512x512/apps/pastemax.png"
}
