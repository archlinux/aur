
# Maintainer: Alexander Björk <bjorkalx@protonmail.com>
# Maintainer: johnpyp <johnpyp.dev@gmail.com>

pkgname="redact-bin"
pkgdesc="Customize Redact to remove the content you'd like. Remove old tweets, images, discord messages, and much more."
pkgver="0.17.4"
pkgrel=1
arch=('x86_64')
url="https://redact.dev/"
license=('custom')
provides=('redact')
conflicts=('redact')
source=("https://update-desktop.redact.dev/build/Redact-${pkgver}.zip"
	"redact.desktop")
sha256sums=('75c3e0c8842208bbf7d4640a49a3d2f42c44c5d21bf2d46023d488cf04dd3089'
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
