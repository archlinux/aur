# Submitter: ian <ian at kremlin dot cc>
# Maintainer: Max Bruckner (FSMaxB)

pkgname=json-sh
pkgver=r103.a82c583
pkgrel=1
pkgdesc="command line json tool written in bash"
arch=('any')
url="https://github.com/dominictarr/JSON.sh"
license=('MIT' 'APACHE')
makedepends=('git')
source=('git://github.com/dominictarr/JSON.sh.git')
md5sums=('SKIP')
depends=('bash')

pkgver() {
	cd "JSON.sh" || exit 1
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

check() {
	cd "$srcdir/JSON.sh" || exit 1
	sh "all-tests.sh"
}

package() {
	cd "JSON.sh" || exit 1
	install -Dm755 "$srcdir/JSON.sh/JSON.sh" "$pkgdir/usr/bin/JSON.sh"
	install -Dm644 "$srcdir/JSON.sh/LICENSE.MIT" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

