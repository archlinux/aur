# Maintainer: Philip Meier <meier.philip@posteo.de>
pkgname='timeular'
pkgver='3.8.0'
pkgrel=1
epoch=1
pkgdesc='A proprietary time tracking service'
arch=('x86_64')
url='https://timeular.com'
license=('unknown')
groups=()
depends=()
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=('https://s3.amazonaws.com/timeular-desktop-packages/linux/production/Timeular.AppImage'
	'timeular.png'
        'timeular.desktop')
noextract=()
sha512sums=('2de29f4b585ad993d076d514195fb6b76341e850dde27ac26eaa14eb7223aede756a2c010ee3dde63f4de6782933835a6c6f671bcccc6d54fc81750f536ca438'
	    'SKIP'
            'SKIP')

package() {
    # No idea why, but the install command below corrupts the file, so we do it manually instead.
    # If you read this and know how to fix it, please let me know.
    # install -Dm755 "${srcdir}/Timeular.AppImage" "${pkgdir}/opt/timeular/Timeular.AppImage" 
    mkdir -p "${pkgdir}/opt/timeular"
    mv "${srcdir}/Timeular.AppImage" "${pkgdir}/opt/timeular/Timeular.AppImage"
    chmod 755 "${pkgdir}/opt/timeular/Timeular.AppImage"
    
    install -Dm644 "${srcdir}/timeular.png" "${pkgdir}/usr/share/pixmaps/timeular.png"
    install -Dm644 "${srcdir}/timeular.desktop" "${pkgdir}/usr/share/applications/timeular.desktop"

    mkdir -p "${pkgdir}/usr/bin"
    ln -s "${pkgdir}/opt/timeular/Timeular.AppImage" "${pkgdir}/usr/bin/timeular"
}

