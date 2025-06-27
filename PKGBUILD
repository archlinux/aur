# Maintainer: Jim Philip <jimphilip394 at gmail dot com>
pkgname=vencord-hook
pkgver=1
pkgrel=11
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
			'b81de32212e58c6245743a24d2b3e28d6b10e3f11a01030b8ec752a0a204f828'
			'SKIP'
			'SKIP')
install="vencord-hook.install"

package() {
	install -Dm644 "$srcdir/vencord-hook.hook" "${pkgdir}/etc/pacman.d/hooks/vencord-hook.hook"
	install -Dm755 "$srcdir/vencord-hook.sh" "${pkgdir}/etc/pacman.d/hookbin/vencord-hook.sh"

	install -Dm644 "$srcdir/LICENSE-VENCORD-HOOK" "$pkgdir/usr/share/licenses/$pkgname/LICENSE-VENCORD-HOOK"
	install -Dm644 "$srcdir/LICENSE-VENCORD" "$pkgdir/usr/share/licenses/$pkgname/LICENSE-VENCORD"
}
