# Maintainer: WitheringAway <124115470+notwithering@users.noreply.github.com>
pkgname=vencord-hook
pkgver=1
pkgrel=9
pkgdesc="Pacman hook to automatically install Vencord after Discord updates"
arch=('any')
url="https://github.com/Vencord/Installer.git"
license=('GPL3' 'MIT')
depends=('bash' 'coreutils' 'curl' 'sed')
source=("vencord.hook"
		"vencord.sh"
		"LICENSE-VENCORD"
		"LICENSE-VENCORD-HOOK")
sha256sums=('d49f2f716890e21828162cf3f75ae0b691e5d91c669e8419419acbbbd4816230'
			'cf316c7df3679829c3f63d3c89692af1d07e4a04d616aea7931725e0411c8671'
			'SKIP'
			'SKIP')
install="vencord-hook.install"

package() {
	install -Dm644 "$srcdir/vencord.hook" "${pkgdir}/etc/pacman.d/hooks/vencord.hook"
	install -Dm755 "$srcdir/vencord.sh" "${pkgdir}/etc/pacman.d/hookbin/vencord.sh"

	install -Dm644 "$srcdir/LICENSE-VENCORD-HOOK" "$pkgdir/usr/share/licenses/$pkgname/LICENSE-VENCORD-HOOK"
	install -Dm644 "$srcdir/LICENSE-VENCORD" "$pkgdir/usr/share/licenses/$pkgname/LICENSE-VENCORD"
}
