# Maintainer: Michael Asher <michael@wesolveeverything.com> 

pkgname=electerm-bin
pkgver=1.32.46
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
sha256sums=('dbf6fe8ef029738bd5f4b0f673130a0c321a8ead793ab011838a4f61c029dddb'
            'b6d96207cff171127c04f59f9eb545b575b71cd93ebc355247cad63e23ca500d'
            '932fdf612b1c77487484e40ea47d1e356e08e8f3e305c69a6c9e2fdc5bfc7104')
