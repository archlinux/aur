#Maintainer: Stikkot

pkgname=zsh-komander
pkgver=1.4
pkgrel=1
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
sha256sums=('bacc67f72dff9b334b5365cb2bcd106f2cd36738e740c7cc5eec58231d671d41'
            '79fc81ec097911ac3e971bc2ed0a3dddbcbdc0699e4da2d4a1997df312b21d65'
            '1eee93882484a32ee699f0c7a3f53353fc068db77b1e68acaa2e411d71d9ec3d'
            '48cff7e7440082cfe63533cf9994f194e4010dc37847e5758386428eed4d7aaa')

package() {
	mkdir -p "$pkgdir/usr/bin"
	install -Dm644 "${srcdir}/${pkgname}.zsh" "$pkgdir/usr/share/${pkgname}/${pkgname}.zsh"
	install -Dm644 "${srcdir}/LICENSE" "$pkgdir/usr/share/licenses/${pkgname}/LECENSE"
	install -Dm644 "${srcdir}/README.md" "$pkgdir/usr/share/doc/${pkgname}/README.md"
	install -Dm755 "${srcdir}/komander-tool.sh" "$pkgdir/usr/share/${pkgname}/komander-tool.sh"
	ln -sf "/usr/share/${pkgname}/komander-tool.sh" "$pkgdir/usr/bin/komander"
}
