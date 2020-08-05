# Maintainer: Michael Asher <michael@wesolveeverything.com> 
pkgname="electerm-bin"
pkgver=1.4.2
pkgrel=1
pkgdesc="An electron-based SSH/SFTP Connection manager and terminal"
arch=('x86_64')
url="https://electerm.html5beta.com"
license=('MIT')
_pkgname="electerm"
provides=("electerm")
source=(
        "https://github.com/electerm/electerm/releases/download/v${pkgver}/${_pkgname}-${pkgver}-linux-x64.tar.gz"
        "https://raw.githubusercontent.com/electerm/electerm/master/LICENSE"
)
sha256sums=('c3a44aec6b9d0c2c3870cf70f9c6defd9d315c70f4c94c2159f88e84f75e496e'
            'b6d96207cff171127c04f59f9eb545b575b71cd93ebc355247cad63e23ca500d')

package() {
        cd "${srcdir}/${_pkgname}-${pkgver}-linux-x64" || exit 2
        mkdir -p ${pkgdir}/usr/share/electerm
        mkdir -p ${pkgdir}/usr/bin
        cp -r . "${pkgdir}/usr/share/electerm"
        ln -s "/usr/share/${_pkgname}/electerm"  "${pkgdir}/usr/bin/${_pkgname}"
        install -Dm644 ${srcdir}/LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}

