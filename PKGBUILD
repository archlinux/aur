# Maintainer: Michael Lass <bevan@bi-co.net>

# This PKGBUILD is maintained on github:
# https://github.com/michaellass/AUR

pkgname=macintosh-js-bin
pkgver=1.0.4
pkgrel=1
pkgdesc='Mac OS 8, running in an Electron app pretending to be a 1991 Macintosh Quadra'
arch=('x86_64')
url='https://github.com/felixrieseberg/macintosh.js'
license=('custom')
depends=(gtk3 nss)
source=("https://github.com/felixrieseberg/macintosh.js/releases/download/v${pkgver}/macintosh.js_${pkgver}_amd64.deb"
        "https://raw.githubusercontent.com/felixrieseberg/macintosh.js/v${pkgver}/CREDITS.md")
sha256sums=('182a37a57ca731e6c7ea1b08e8ba338a0b7952033bc00af45b0d8dffb63193d1'
            '6a221f623fa4f773ea6ba81c8a1731ff0d680cc7e8f20c68488c31b0f13e3dec')

package() {
	tar -xvf data.tar.xz -C "$pkgdir"

	install -dm755 "${pkgdir}"/usr/share/licenses/${pkgname}
	cp "${srcdir}"/CREDITS.md "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE.md
}
