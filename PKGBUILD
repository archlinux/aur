# Maintainer: Your Name <your.email@example.com>
pkgname=open-video-downloader
pkgver=3.0.0
pkgrel=1
pkgdesc="A cross-platform GUI for youtube-dl made in Rust with Tauri and Vue + Typescript"
arch=('x86_64')
url="https://github.com/jely2002/youtube-dl-gui"
license=('AGPL3')
depends=('gtk3' 'webkit2gtk')
optdepends=()
source=("${pkgname}-${pkgver}.deb::https://github.com/jely2002/youtube-dl-gui/releases/download/app-v${pkgver}/Open.Video.Downloader_${pkgver}_amd64.deb")
sha256sums=('9696d93863261100d19e477a295bad55856ce6c552b0ae7b972344a8d58c175b')

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
