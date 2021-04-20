# Maintainer: Philip Meier <meier.philip@posteo.de>
pkgname='timeular'
pkgver='3.8.0'
pkgrel=2
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
sha512sums=('2de29f4b585ad993d076d514195fb6b76341e850dde27ac26eaa14eb7223aede756a2c010ee3dde63f4de6782933835a6c6f671bcccc6d54fc81750f536ca438'
	    'SKIP'
	    'SKIP'
            'SKIP')

package() {
    target="/opt/${pkgname}/${pkgname}-${pkgver}.appimage"
    install -Dm755 "${srcdir}/Timeular.AppImage" "${pkgdir}/${target}" 
    mkdir -p "${pkgdir}/usr/bin"
    ln -s ${target} "${pkgdir}/usr/bin/timeular"
    
    install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 "${srcdir}/timeular.png" "${pkgdir}/usr/share/pixmaps/timeular.png"
    install -Dm644 "${srcdir}/timeular.desktop" "${pkgdir}/usr/share/applications/timeular.desktop"
}

