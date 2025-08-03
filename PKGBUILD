#Maintainer: Stikkot

pkgname=zsh-komander
pkgver=1.3
pkgrel=2
pkgdesc="Minimalistic zsh-theme..."
arch=('any')
url="https://github.com/stikundra-murtsi/zsh-komander"
license=('custom:NAUPL')
depends=('zsh')
source=(
	"${pkgname}.zsh"
	"komander-tool.sh"
	"LICENSE"
	"README.md"
)
sha256sums=('96082435cb8f5e8df4c3f503331f7e4382a32cdc9364b835b361c3ce0ae19fbd'
            '79fc81ec097911ac3e971bc2ed0a3dddbcbdc0699e4da2d4a1997df312b21d65'
            '75d0d33f190772597e1e5775c0ae7ed6a456189a8bf7d93dc8dd6d361a750915'
            '3c17b0266b2cc00751e56bc9bdf1767e2d26eb951f2cf834e8e4e5547cf44d1c')

package() {
	mkdir -p "$pkgdir/usr/bin"
	install -Dm644 "${srcdir}/${pkgname}.zsh" "$pkgdir/usr/share/${pkgname}/${pkgname}.zsh"
	install -Dm644 "${srcdir}/LICENSE" "$pkgdir/usr/share/licenses/${pkgname}/LECENSE"
	install -Dm644 "${srcdir}/README.md" "$pkgdir/usr/share/doc/${pkgname}/README.md"
	install -Dm755 "${srcdir}/komander-tool.sh" "$pkgdir/usr/share/${pkgname}/komander-tool.sh"
	ln -sf "/usr/share/${pkgname}/komander-tool.sh" "$pkgdir/usr/bin/komander"
}

