# Maintainer: wxqwinner <wxqwinner@gmail.com>
pkgname=script-communicator-bin
_pkgname=script-communicator
pkgver=6.08
_pkgver=0${pkgver/./_}
pkgrel=0
pkgdesc="Scriptable data terminal which supports several interfaces."
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/scriptcommunicator/"
license=('GPL3')
conflicts=(
    'script-communicator'
    'script-communicator-git'
)
makedepends=('unzip')

source=("ScriptCommunicator_${_pkgver}_linux_64_bit.tar.xz::https://sourceforge.net/projects/scriptcommunicator/files/Linux_64Bit/ScriptCommunicator_${_pkgver}_linux_64_bit.tar.xz"
        "$pkgname.desktop"
        "$pkgname.png"
        "script-communicator"
        )

sha256sums=(
    '126eb1508725ad9ce25b2c708fd1f1989b68a3de907c0e03e27e970783bdf186'
    'fe4902f479a21119a2d9387da6d637fc392fae06abbba3b52439fd6a18bc6c3c'
    'f36ca3633c09ffb894c6b9c43f20726376cee36472b121e067688e17247e09a7'
    'e67eb1cefba5a1635d316792eeda80ce76d73757a4a2f68ffe477ee2dc248822'
    )

package() {

    # Install
    install -d "${pkgdir}/opt/${pkgname}"
    cp -r ./ScriptCommunicator_${_pkgver}_linux_64_bit/* "${pkgdir}/opt/${pkgname}"

    chmod 755 "${pkgdir}/opt/script-communicator-bin/lib"
    chmod 755 -R "${pkgdir}/opt/script-communicator-bin/plugins"

    install -Dm 755 ${srcdir}/script-communicator ${pkgdir}/usr/bin/script-communicator

    # Install Desktop file
    install -Dm644 "${srcdir}/script-communicator-bin.desktop" "${pkgdir}/usr/share/applications/script-communicator-bin.desktop"

    # Install Icon images
    install -Dm644 "${srcdir}/script-communicator-bin.png" "${pkgdir}/usr/share/pixmaps/script-communicator-bin.png"
}
