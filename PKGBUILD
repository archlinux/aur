# Maintainer: Michael Asher <michael@wesolveeverything.com> 

pkgname="electerm-bin"
pkgver=1.3.8
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

sha256sums=('e2e6a11406ee3f297d0df3dd9c728dfbe2026062b753cf9440353e5a15fc424f'
            'b6d96207cff171127c04f59f9eb545b575b71cd93ebc355247cad63e23ca500d')

package() {
	cd "${srcdir}/${_pkgname}-${pkgver}-linux-x64" || exit 2
	mkdir -p ${pkgdir}/usr/share/electerm
	mkdir -p ${pkgdir}/usr/bin
	cp -r . "${pkgdir}/usr/share/electerm"
	ln -s "/usr/share/${_pkgname}/electerm"  "${pkgdir}/usr/bin/${_pkgname}"
	install -Dm644 ${srcdir}/LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
