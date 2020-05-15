# Maintainer: Michael Asher <michael@wesolveeverything.com> 

pkgname="electerm-bin"
pkgver=1.3.28
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

sha256sums=('811b134b6a46789d7c4419417c52168581a18e7d619a042c61b5d6fdc3b24b44'
            'b6d96207cff171127c04f59f9eb545b575b71cd93ebc355247cad63e23ca500d')
package() {
	cd "${srcdir}/${_pkgname}-${pkgver}-linux-x64" || exit 2
	mkdir -p ${pkgdir}/usr/share/electerm
	mkdir -p ${pkgdir}/usr/bin
	cp -r . "${pkgdir}/usr/share/electerm"
	ln -s "/usr/share/${_pkgname}/electerm"  "${pkgdir}/usr/bin/${_pkgname}"
	install -Dm644 ${srcdir}/LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
