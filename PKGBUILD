# Maintainer: Michael Asher <michael@wesolveeverything.com>

pkgname=electerm-bin
pkgver=1.51.18
pkgrel=1
pkgdesc="An electron-based SSH/SFTP Connection manager and terminal"
arch=('x86_64')
url="https://electerm.html5beta.com"
license=('MIT')
_pkgname="electerm"
provides=("electerm")
conflicts=("electerm" "electerm-git")
source=(
        "https://github.com/electerm/electerm/releases/download/v${pkgver}/${_pkgname}-${pkgver}-linux-amd64.deb"
        "https://raw.githubusercontent.com/electerm/electerm/master/LICENSE"
)

prepare() {
        ar -x ${_pkgname}-${pkgver}-linux-amd64.deb
        cd ${srcdir}
        tar -xf ./data.tar.xz  
}

package() {
        cp -r ${srcdir}/opt ${pkgdir}/
        cp -r ${srcdir}/usr ${pkgdir}/
        install -Dm644 ${srcdir}/LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}

sha256sums=('b2be689e8a6e4ce3c205a6aa37c9d0a1c54430a6b2e4186cb63560994453feda'
            'a9b7ccf11bec7796b217a7575d3324c16613a46bfc899e72ec2c11da28d0991e')

