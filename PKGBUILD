# Maintainer: Brightbites <brightbites667@gmail.com>
pkgname=tagstudio-bin
pkgver=9.6.1
pkgrel=2
pkgdesc="A User-Focused Photo & File Management System (pre-compiled)"
arch=('x86_64')
url="https://github.com/TagStudioDev/TagStudio"
license=('GPL-3.0-only')
depends=(
    'libva'
    'libvdpau'
    'libxrandr'
    'pipewire'
    'qt6-base'
    'qt6-multimedia'
    'qt6-wayland'
    'ripgrep'
)

optdepends=('ffmpeg: audio/video thumbnails and playback'
            'unrar: RAR based files thumbnails'
            )

source=("${pkgname}-${pkgver}.tar.gz::https://github.com/TagStudioDev/TagStudio/releases/download/v${pkgver}/tagstudio_v${pkgver}_linux_x86_64.tar.gz"
        "tagstudio.desktop")
sha256sums=('30ec6843a0c12f848de1c2f1ecc12d012425f3409a7693e9454b4a8b80fca764'
            '34a0e7ac51e1de54d0df1baac9e65e4fa04182c663fbc6c3451fe8f8a9b09a8a')

package(){
    cd "$srcdir"

    #install the application itself
    install -dm755 "$pkgdir/usr/share/tagstudio/"
    cp -a "$srcdir/tagstudio"/* "$pkgdir/usr/share/tagstudio/"

    #install .desktop
    install -Dm644 "$srcdir/tagstudio.desktop" "$pkgdir/usr/share/applications/tagstudio.desktop"
}

post_install(){
    alias tagstudio='/usr/share/tagstudio/tagstudio'
}
