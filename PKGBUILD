# Maintainer: Michael Asher <michael@wesolveeverything.com> 

pkgname="electerm-bin"
pkgver=1.0.28
pkgrel=4
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

sha256sums=('b1a24c66af425373bef48d002bdc159d4ef7921ac793dfbf481d0dff6e56900e'
            'b6d96207cff171127c04f59f9eb545b575b71cd93ebc355247cad63e23ca500d')

package() {
	cd "${srcdir}/${_pkgname}-${pkgver}-linux-x64" || exit 2
	mkdir -p ${pkgdir}/usr/share/electerm
	mkdir -p ${pkgdir}/usr/bin
	cp -r . "${pkgdir}/usr/share/electerm"
	ln -s "/usr/share/${_pkgname}/electerm"  "${pkgdir}/usr/bin/${_pkgname}"
	install -Dm644 ${srcdir}/LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
