# Maintainer: Wellinton Vieira <wellintonvieira.office@gmail.com>

pkgname="update-mirrors"
pkgver=r23.2a36905
pkgrel=1
pkgdesc="CLI to update the Arch Linux mirrorlist"
arch=("any")
url="https://github.com/nellowint/update-mirrors"
license=("GPL-3.0-or-later")
depends=("bash-completion" "curl")
makedepends=("git")
source=("git+https://github.com/nellowint/update-mirrors.git")
sha256sums=('SKIP')

pkgver() {
	cd update-mirrors
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

package() {
	cd update-mirrors
	install -Dm755 update-mirrors.sh "$pkgdir/usr/bin/update-mirrors"
	install -Dm644 update-mirrors-complete.sh "$pkgdir/usr/share/bash-completion/completions/update-mirrors"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
