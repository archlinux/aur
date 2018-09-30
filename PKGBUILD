# Maintainer: JC Francois <jc.francois@gmail.com>
pkgname=tiddlydesktop
pkgver=0.0.13
pkgrel=2
pkgdesc="TiddlyDesktop is a special purpose web browser for working with locally stored TiddlyWikis."
url="https://github.com/Jermolene/TiddlyDesktop"
license=('BSD')
provides=('tiddlydesktop')
depends=('gconf')
optdepends=('tiddlywiki: empty tiddlywiki file and utility script')
arch=('x86_64')
options=(!strip)

source=(https://github.com/Jermolene/TiddlyDesktop/releases/download/v${pkgver}/tiddlydesktop-linux64-v${pkgver}.zip
        https://github.com/Jermolene/TiddlyDesktop/archive/v${pkgver}.zip
        tiddlydesktop.sh
		tiddlydesktop.desktop)

sha256sums=('91eb42a282ff41c3571661a70cb6b8b0656e50a6bcf9be793ec0861d9435974a'
            '053c78173ce3af2942160daa414ad411c912f62e17deb02617be70ab3bd34c39'
            'ec5826348934f45ba28209f00a96073876910aec3bc1bc5e7c6cc68216099998'
            'a20ee572397a00857ed9f64c2e622f544b097d203add91449a07526deac95099')

package() {
    install -dm755 "${pkgdir}/usr/share/${pkgname}"
    cp -r ${srcdir}/TiddlyDesktop-linux64-v${pkgver}/*  ${pkgdir}/usr/share/${pkgname}/
    # give mode 775 to subdirectories of /usr/share/tiddlydesktop
    find ${pkgdir}/usr/share/${pkgname}/ -type d -exec chmod 775 {} +

    install -Dm755 "${srcdir}/tiddlydesktop.sh"  "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 "${srcdir}/tiddlydesktop.desktop"  "${pkgdir}/usr/share/applications/tiddlydesktop.desktop"
    install -Dm644 "${srcdir}/TiddlyDesktop-${pkgver}/icons/app-icon32.png"  "${pkgdir}/usr/share/icons/hicolor/32x32/apps/tiddlydesktop.png"
    install -Dm644 "${srcdir}/TiddlyDesktop-${pkgver}/icons/app-icon48.png"  "${pkgdir}/usr/share/icons/hicolor/48x48/apps/tiddlydesktop.png"
    install -Dm644 "${srcdir}/TiddlyDesktop-${pkgver}/icons/app-icon64.png"  "${pkgdir}/usr/share/icons/hicolor/64x64/apps/tiddlydesktop.png"
    install -Dm644 "${srcdir}/TiddlyDesktop-${pkgver}/icons/app-icon128.png"  "${pkgdir}/usr/share/icons/hicolor/128x128/apps/tiddlydesktop.png"
    install -Dm644 "${srcdir}/TiddlyDesktop-${pkgver}/icons/app-icon256.png"  "${pkgdir}/usr/share/icons/hicolor/256x256/apps/tiddlydesktop.png"
    install -Dm644 "${srcdir}/TiddlyDesktop-${pkgver}/icons/app-icon512.png"  "${pkgdir}/usr/share/icons/hicolor/512x512/apps/tiddlydesktop.png"
    install -Dm644 "${srcdir}/TiddlyDesktop-${pkgver}/icons/app-icon1024.png"  "${pkgdir}/usr/share/icons/hicolor/1024x1024/apps/tiddlydesktop.png"
}
