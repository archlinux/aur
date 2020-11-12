# Maintainer: Maxwell Fortney <maxwellfortney@gmail.com>
pkgname=bluebubbles-desktop-app
pkgver=1.0.2
pkgrel=1
pkgdesc="Cross-platform iMessage client"
arch=('x86_64')
url="https://bluebubbles.app/"
license=('unknown')
optdepends=('noto-fonts-emoji')
changelog=
sha256sums=('5850b62567f600cb5cbf4d51a094fe385672a4029585a12efdd47d925d22eb25')
source=("$pkgname-$pkgver.deb::https://github.com/BlueBubblesApp/BlueBubbles-Desktop-App/releases/download/$pkgver/$pkgname-$pkgver.deb")

package() {
    #Get the data from the deb
    tar -xvf data.tar.xz 

    # Install the main files.
    install -d "${pkgdir}/opt/BlueBubbles"
    cp -a "./opt/BlueBubbles/." "${pkgdir}/opt/BlueBubbles"

    # Install desktop shortcut
	install -Dm644 "./usr/share/applications/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"

    # Create symbolic link to the icon
    install -d "${pkgdir}/usr/share/pixmaps"
    ln -s "/opt/BlueBubbles/resources/resources/icon1024.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
}
