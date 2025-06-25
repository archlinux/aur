# Maintainer: MalikHw47 <help.malicorporation@gmail.com>
pkgname=hwytvidgrabber-bin
pkgver=1.5.3
pkgrel=1
pkgdesc="A smol YouTube video downloader by MalikHw47 (Lightweight af)"
arch=('x86_64')
url="https://github.com/MalikHw/HwYtVidGrabber"
license=('MIT')
depends=('ffmpeg')
provides=('hwytvidgrabber')
conflicts=('hwytvidgrabber')
source=("HwYtVidGrabber-Linux-${pkgver}::${url}/releases/download/1.5.3/HwYtVidGrabber-Linux"
        "hwytvidgrabber.desktop::${url}/releases/download/1.5.3/hwytvidgrabber.desktop"
        "hwytvidgrabber.png::${url}/releases/download/1.5.3/icon.png")
sha256sums=('7f43b410a4d8bf697ce332ff3cde55f2bb7cbac4da56db175d758d8cf9147fb5'
            '9df2fa7d8bc10298f1eed8c2258b21612d26f63b1b44e625938de2c644012077'
            '15b461eb068f1fd54222122fac891c72f647b28e8af56a3bd28c152754b39e40')
noextract=('HwYtVidGrabber-Linux-${pkgver}')

package() {
    # Install the binary with executable permissions
    install -Dm755 "${srcdir}/HwYtVidGrabber-Linux-${pkgver}" "${pkgdir}/usr/bin/hwytvidgrabber"
    
    # Create a symlink for the original name too
    ln -sf hwytvidgrabber "${pkgdir}/usr/bin/HwYtVidGrabber"
    
    # Install desktop file
    install -Dm644 "${srcdir}/hwytvidgrabber.desktop" "${pkgdir}/usr/share/applications/hwytvidgrabber.desktop"
    
    # Install icon
    install -Dm644 "${srcdir}/hwytvidgrabber.png" "${pkgdir}/usr/share/pixmaps/hwytvidgrabber.png"
    
    # Also install icon in hicolor theme for better integration
    install -Dm644 "${srcdir}/hwytvidgrabber.png" "${pkgdir}/usr/share/icons/hicolor/256x256/apps/hwytvidgrabber.png"
}
