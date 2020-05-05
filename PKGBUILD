# Maintainer: JC Francois <jc.francois@gmail.com>
pkgname=tiddlydesktop
pkgver=0.0.14
pkgrel=1
pkgdesc="TiddlyDesktop is a special purpose web browser for working with locally stored TiddlyWikis."
url="https://github.com/Jermolene/TiddlyDesktop"
license=('BSD')
provides=('tiddlydesktop')
depends=('gconf' 'libxss')
optdepends=('tiddlywiki: empty tiddlywiki file and utility script')
arch=('x86_64')
options=(!strip)

source=(https://github.com/Jermolene/TiddlyDesktop/releases/download/v${pkgver}/tiddlydesktop-linux64-v${pkgver}.zip
        https://github.com/Jermolene/TiddlyDesktop/archive/v${pkgver}.zip
        tiddlydesktop.sh
		tiddlydesktop.desktop)

sha256sums=('c82b2a07ac792b98dd6a2de80847f80334ae0e59700dce4cbd1e21a1f8e1db8d'
            'ee10b903f6a88190c26855230f6c6c28deab804221bbb73f4b4757efec2eb15b'
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
