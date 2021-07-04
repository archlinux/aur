# Maintainer: Alexander Björk <bjorkalx@protonmail.com>

pkgname="redact-bin"
pkgdesc="Customize Redact to remove the content you'd like. Remove old tweets, images, discord messages, and much more."
pkgver="0.12.9"
pkgrel=1
arch=('x86_64')
url="https://redact.dev/"
license=('custom')
provides=('redact')
conflicts=('redact')
source=("https://electron-release.redact.dev/build/Redact-${pkgver}.zip"
	"redact.desktop")
sha256sums=('206ec74614e39df95a2fa13328932c9c5c99fb2ddc11a701788450f240ec274a'
    '9316d86af16819bd94452e0184830e92fbb497e123fa3f8df00811e4b9861e41')


package() {
    install -d ${pkgdir}/opt/${pkgname}
    cp -r $srcdir/* ${pkgdir}/opt/${pkgname}/
    install -d ${pkgdir}/usr/bin
    ln -s /opt/${pkgname}/redact ${pkgdir}/usr/bin/redact
    install -Dm644 "${srcdir}/redact.desktop" "${pkgdir}/usr/share/applications/redact.desktop"
}
