#Maintainer: Stikkot

pkgname=zsh-komander
pkgver=1.0
pkgrel=3
pkgdesc="Minimalistic zsh-theme..."
arch=('any')
url="https://github.com/stikundra-murtsi/zsh-komander"
license=('custom:NAUPL')
depends=('zsh')
install="${pkgname}.install"
source=(
	"${pkgname}.zsh"
	"${pkgname}.install"
	"${pkgname}-setup.sh"
	"LICENSE"
	"README.md"
)
sha256sums=('8daffcb80162ffd2e2608fdc9316c7dfe1c1503069b32312485eb1cd6d7058fa'
            '815f92dbccdd84a3767dc68f22c620886018f0b1e4b307c27ac29dd3a530e0c7'
            'c8cb02b83d4576324b19a906fe4929dd7ecea295add07575bd04a88c1efd929f'
            '75d0d33f190772597e1e5775c0ae7ed6a456189a8bf7d93dc8dd6d361a750915'
            '281903190d85124423fec6d9dd607e5cab16528bf885795d36f22b9021ccad1f')

package() {
	mkdir -p "$pkgdir/usr/bin"
	install -Dm644 "${srcdir}/${pkgname}.zsh" "$pkgdir/usr/share/${pkgname}/${pkgname}.zsh"
	install -Dm644 "${srcdir}/LICENSE" "$pkgdir/usr/share/licenses/${pkgname}/LECENSE"
	install -Dm644 "${srcdir}/README.md" "$pkgdir/usr/share/doc/${pkgname}/README.md"
	install -Dm755 "${srcdir}/${pkgname}-setup.sh" "$pkgdir/usr/share/${pkgname}/${pkgname}-setup.sh"
	ln -sf "/usr/share/${pkgname}/${pkgname}-setup.sh" "$pkgdir/usr/bin/komander-setup"
}

