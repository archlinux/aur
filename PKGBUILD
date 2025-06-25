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
source=("HwYtVidGrabber-Linux-${pkgver}::${url}/releases/latest/download/HwYtVidGrabber-Linux"
        "hwytvidgrabber.desktop::${url}/releases/latest/download/hwytvidgrabber.desktop"
        "hwytvidgrabber.png::${url}/releases/latest/download/icon.png")
sha256sums=('e1ccba79250f6a679486d1c81a771341fd9ad1054b7e1fced4dbe20013d82dd2'
            '6ad7354ba78532169bb3edc13d6c2d59945bcb5f4e9cf3759f485bc5e99b3867'
            '15b461eb068f1fd54222122fac891c72f647b28e8af56a3bd28c152754b39e40')
noextract=('HwYtVidGrabber-Linux-${pkgver}')

package() {
    # Install the binary
    install -Dm755 "${srcdir}/HwYtVidGrabber-Linux-${pkgver}" "${pkgdir}/usr/bin/HwYtVidGrabber"
    
    # Install desktop file
    install -Dm644 "${srcdir}/hwytvidgrabber.desktop" "${pkgdir}/usr/share/applications/hwytvidgrabber.desktop"
    
    # Install icon
    install -Dm644 "${srcdir}/hwytvidgrabber.png" "${pkgdir}/usr/share/pixmaps/hwytvidgrabber.png"
}
