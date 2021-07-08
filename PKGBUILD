
# Maintainer: Alexander Björk <bjorkalx@protonmail.com>

pkgname="redact-bin"
pkgdesc="Customize Redact to remove the content you'd like. Remove old tweets, images, discord messages, and much more."
pkgver="0.13.0"
pkgrel=1
arch=('x86_64')
url="https://redact.dev/"
license=('custom')
provides=('redact')
conflicts=('redact')
source=("https://electron-release.redact.dev/build/Redact-${pkgver}.zip"
	"redact.desktop")
sha256sums=('272979886a6ff6e7b3cfb5cd7b44dab5974c1f639522e5cad5ae234cfe5132b2'
    '9316d86af16819bd94452e0184830e92fbb497e123fa3f8df00811e4b9861e41')


package() {
    install -d ${pkgdir}/opt/${pkgname}
    cp -r $srcdir/* ${pkgdir}/opt/${pkgname}/
    install -d ${pkgdir}/usr/bin
    ln -s /opt/${pkgname}/redact ${pkgdir}/usr/bin/redact
    install -Dm644 "${srcdir}/redact.desktop" "${pkgdir}/usr/share/applications/redact.desktop"
}
