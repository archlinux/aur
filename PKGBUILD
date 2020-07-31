# Maintainer: Michael Lass <bevan@bi-co.net>

# This PKGBUILD is maintained on github:
# https://github.com/michaellass/AUR

pkgname=macintosh-js-bin
pkgver=1.0.5
pkgrel=1
pkgdesc='Mac OS 8, running in an Electron app pretending to be a 1991 Macintosh Quadra'
arch=('x86_64')
url='https://github.com/felixrieseberg/macintosh.js'
license=('custom')
depends=(gtk3 nss)
source=("https://github.com/felixrieseberg/macintosh.js/releases/download/v${pkgver}/macintosh.js_${pkgver}_amd64.deb"
        "https://raw.githubusercontent.com/felixrieseberg/macintosh.js/v${pkgver}/CREDITS.md")
sha256sums=('fe122471e4534da365cb5758b52c78513811453d01e26d65efc8127479c38c3b'
            '6a221f623fa4f773ea6ba81c8a1731ff0d680cc7e8f20c68488c31b0f13e3dec')

package() {
	tar -xvf data.tar.xz -C "$pkgdir"

	install -dm755 "${pkgdir}"/usr/share/licenses/${pkgname}
	cp "${srcdir}"/CREDITS.md "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE.md
}
