# Maintainer: Brightbites <brightbites667@gmail.com>
pkgname=tagstudio-bin
pkgver=9.5.7
pkgrel=4
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

source=("${pkgname}-${pkgver}.tar.gz::https://github.com/TagStudioDev/TagStudio/releases/download/v${pkgver}/tagstudio_linux_x86_64.tar.gz"
        "tagstudio.desktop")
sha256sums=('5db6b27ce958a97b6c2fef26f674058ddecc1b8c81837092f6c4e1ae59405e5a'
            '78940c7963ca5d59c8d674eb73c50e7c2e95372de43d3656ad727147b1d7788c')

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
