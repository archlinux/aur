# Maintainer: Philip Meier <meier.philip@posteo.de>
pkgname='timeular'
pkgver='3.9.1'
pkgrel=0
pkgdesc='A proprietary time tracking service'
arch=('x86_64')
url='https://timeular.com'
license=('custom')
depends=('zlib')
options=('!strip')
source=('https://s3.amazonaws.com/timeular-desktop-packages/linux/production/Timeular.AppImage'
	'LICENSE'
	'timeular.png'
        'timeular.desktop')
sha512sums=('f1094ee87164454d13b4065c7b756155507ee5599f59f7e821f501c4d83436ab4dc76ea60a2405a86c919683f0a95462f05ac83c3cab5f9e536ad6fa3644f9c0'
	    'SKIP'
	    'SKIP'
            'SKIP')

package() {
    target="/opt/${pkgname}/${pkgname}-${pkgver}.appimage"
    install -Dm755 "${srcdir}/Timeular.AppImage" "${pkgdir}/${target}" 
    mkdir -p "${pkgdir}/usr/bin"
    ln -s "${target}" "${pkgdir}/usr/bin/timeular"
    
    install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 "${srcdir}/timeular.png" "${pkgdir}/usr/share/pixmaps/timeular.png"
    install -Dm644 "${srcdir}/timeular.desktop" "${pkgdir}/usr/share/applications/timeular.desktop"
}

