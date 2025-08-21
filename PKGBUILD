# Maintainer: Jim Philip <jimphilip394 at gmail dot com>
pkgname=vencord-hook
pkgver=1
pkgrel=12
pkgdesc="Pacman hook to automatically install Vencord after Discord updates"
arch=('any')
url="https://github.com/Vencord/Installer.git"
license=('GPL3' 'MIT')
depends=('bash' 'coreutils' 'curl' 'sed')
source=("vencord-hook.hook"
		"vencord-hook.sh"
		"LICENSE-VENCORD"
		"LICENSE-VENCORD-HOOK")
sha256sums=('3b43547e2b3956403b64d16730907552564d442987a10c0d0e12b359e1484b0d'
			'4a2f556832438dfa5b1ddf54f863db1b35637dde8b2ee1017a06e65483a71476'
			'SKIP'
			'SKIP')
install="vencord-hook.install"

package() {
	install -Dm644 "$srcdir/vencord-hook.hook" "$pkgdir/etc/pacman.d/hooks/vencord-hook.hook"
	install -Dm755 "$srcdir/vencord-hook.sh" "$pkgdir/etc/pacman.d/hookbin/vencord-hook.sh"

	install -Dm644 "$srcdir/LICENSE-VENCORD-HOOK" "$pkgdir/usr/share/licenses/$pkgname/LICENSE-VENCORD-HOOK"
	install -Dm644 "$srcdir/LICENSE-VENCORD" "$pkgdir/usr/share/licenses/$pkgname/LICENSE-VENCORD"
}
