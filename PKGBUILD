# Maintainer: Your Name <your.email@example.com>
pkgname=open-video-downloader
pkgver=3.0.1
pkgrel=1
pkgdesc="A cross-platform GUI for youtube-dl made in Rust with Tauri and Vue + Typescript"
arch=('x86_64')
url="https://github.com/jely2002/youtube-dl-gui"
license=('AGPL3')
depends=('gtk3' 'webkit2gtk')
optdepends=()
source=("${pkgname}-${pkgver}.deb::https://github.com/jely2002/youtube-dl-gui/releases/download/app-v${pkgver}/Open.Video.Downloader_${pkgver}_amd64.deb")
sha256sums=('5be55329984002d3420ab3c49f95c142062b555e20455bb0552e1b446eaa0660')

package() {
    # Extract the .deb package
    bsdtar -xf "${srcdir}/data.tar.gz" -C "${pkgdir}"

    # Fix permissions
    chmod -R u=rwX,go=rX "${pkgdir}"

    # Remove unnecessary files if present
    if [ -d "${pkgdir}/usr/share/doc" ]; then
        rm -rf "${pkgdir}/usr/share/doc"
    fi
}
