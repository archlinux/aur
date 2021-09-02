
# Maintainer: Alexander Björk <bjorkalx@protonmail.com>
# Maintainer: johnpyp <johnpyp.dev@gmail.com>

pkgname="redact-bin"
pkgdesc="Customize Redact to remove the content you'd like. Remove old tweets, images, discord messages, and much more."
pkgver="0.16.0"
pkgrel=1
arch=('x86_64')
url="https://redact.dev/"
license=('custom')
provides=('redact')
conflicts=('redact')
source=("https://update-desktop.redact.dev/build/Redact-${pkgver}.zip"
	"redact.desktop")
sha256sums=('55a3b62ebc49a4417054d1f86345ecea3eaf7bf55e441dbb13e961532c674e2f'
            'a05e8dd421979d3342dfaa011129ef3fdf0905b6bcf26646c687a3b63504081b')


package() {
    install -d ${pkgdir}/opt/${pkgname}
    cp -r $srcdir/* ${pkgdir}/opt/${pkgname}/
    install -d ${pkgdir}/usr/bin
    ln -s /opt/${pkgname}/redact ${pkgdir}/usr/bin/redact
    install -Dm644 "${srcdir}/redact.desktop" "${pkgdir}/usr/share/applications/redact.desktop"
    mkdir -p "${pkgdir}/usr/share/pixmaps"
    ln -s /opt/${pkgname}/resources/assets/icon.png "${pkgdir}/usr/share/pixmaps/redact.png"
}
