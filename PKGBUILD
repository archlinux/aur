# Maintainer: Michael Asher <michael@wesolveeverything.com> 

pkgname=electerm-bin
pkgver=1.32.28
pkgrel=1
pkgdesc="An electron-based SSH/SFTP Connection manager and terminal"
arch=('x86_64')
url="https://electerm.html5beta.com"
license=('MIT')
_pkgname="electerm"
provides=("electerm")
conflicts=("electerm")
source=(
	"https://github.com/electerm/electerm/releases/download/v${pkgver}/${_pkgname}-${pkgver}-linux-x64.tar.gz"
	"https://raw.githubusercontent.com/electerm/electerm/master/LICENSE"
        "${_pkgname}.desktop"
)

package() {
	cd "${srcdir}/${_pkgname}-${pkgver}-linux-x64" || exit 2
	mkdir -p ${pkgdir}/usr/share/electerm
	mkdir -p ${pkgdir}/usr/bin
	cp -r . "${pkgdir}/usr/share/electerm"
	ln -s "/usr/share/${_pkgname}/electerm"  "${pkgdir}/usr/bin/${_pkgname}"
	install -Dm644 ${srcdir}/LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
	install -Dm644 ${srcdir}/${_pkgname}.desktop "$pkgdir/usr/share/applications/${_pkgname}.desktop" 
}
sha256sums=('6339b8f27bd19b3e121a0d3fa5a9dd242ca4f8c60e9964b73e71c6f60ceddb22'
            'b6d96207cff171127c04f59f9eb545b575b71cd93ebc355247cad63e23ca500d'
            '932fdf612b1c77487484e40ea47d1e356e08e8f3e305c69a6c9e2fdc5bfc7104')
