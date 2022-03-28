# Maintainer: Liganic <liganic-aur at gmx dot net>
# Contributor: Felix Golatofski <contact@xdfr.de>
# Contributor: ian <ian at kremlin dot cc>
# Contributor: Max Bruckner (FSMaxB)

pkgname=json-sh
pkgver=r106.0d5e5c7
pkgrel=2
pkgdesc="command line json tool written in bash"
arch=('any')
url="https://github.com/dominictarr/JSON.sh"
license=('MIT' 'APACHE')
makedepends=('git')
source=('git+https://github.com/dominictarr/JSON.sh.git')
sha256sums=('SKIP')
depends=('bash')

pkgver() {
	cd "JSON.sh"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

check() {
	cd "$srcdir/JSON.sh"
	sh "all-tests.sh"
}

package() {
	cd "JSON.sh"
	install -Dm755 "$srcdir/JSON.sh/JSON.sh" "$pkgdir/usr/bin/JSON.sh"
	install -Dm644 "$srcdir/JSON.sh/LICENSE.MIT" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

