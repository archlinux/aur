# Maintainer: Lift <clairdesoleil123@gmail.com>

pkgname=aqua-eap
pkgver=233.13135.75
pkgrel=1
epoch=1
pkgdesc="A powerful IDE for test automation by JetBrains."
arch=('any')
options=('!strip')
url="https://www.jetbrains.com/aqua"
license=("custom")
optdepends=()

source=("https://download-cdn.jetbrains.com/aqua/aqua-${pkgver}.tar.gz"
	"aqua-eap.desktop")
sha256sums=('2831fa44927f3ac3a88e6161ca6a410c65bc91548fb6135756e217b954c5acfa'
	        'f246e1ca271a49160a31107491c8b6b09a93ae4352ca928df3b16663967aa599')

package() {
    # create the target folders
    install -dm 755 "${pkgdir}/usr/share/licenses/aqua" "${pkgdir}/usr/bin/" "${pkgdir}/opt/"

    # install the package content
    cp -rdp --no-preserve=ownership "./aqua-${pkgver}/" "${pkgdir}/opt/${pkgname}"
    install -Dm644 "./${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"

    ln -s "/opt/${pkgname}/bin/aqua.sh" "${pkgdir}/usr/bin/aqua"
    ln -s "/opt/${pkgname}/license" "${pkgdir}/usr/share/licenses/aqua/"
}

