# shellcheck disable=SC2034,SC2154,SC2164
# Maintainer: Energetix/Dark Nebula <https://github.com/Jobanny-Friki>

pkgname=vault-crypt-git
pkgver=r5.ed3af56
pkgrel=1
pkgdesc="Minimalist GPG-powered vault encryption for KeePassXC: no cloud, no traces, just your keys"
arch=('any')
url="https://github.com/DeadSwitch404/vault-crypt"
license=('LicenseRef-unknown')
depends=('bash' 'gnupg')
makedepends=('git')
provides=('vault-crypt')
conflicts=('vault-crypt')
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
	cd "vault-crypt"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

package() {
	cd "vault-crypt"
	install -Dm755 vault-crypt.sh "$pkgdir/usr/bin/vault-crypt"
	install -Dm644 README.md "$pkgdir/usr/share/doc/vault-crypt/README.md"
	cp -a examples "$pkgdir/usr/share/doc/vault-crypt/"
}
