# Maintainer: Stefan Seemayer <seemayer@semicolonsoftware.de>
pkgname=zapply-git
pkgver=r6.d66e67d
pkgrel=1
pkgdesc="Batch-run commands with zsh globbing and pattern matching"
arch=(any)
url="https://github.com/sseemayer/Zapply"
license=('MIT')
depends=(zsh)
optdepends=(
	'parallel: parallel apply support'
)
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
replaces=()
backup=()
options=()
source=('git+https://github.com/sseemayer/zapply.git')
noextract=()
sha256sums=('SKIP')


pkgver() {
	cd "$srcdir/${pkgname%-git}" || exit
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "$srcdir/${pkgname%-git}" || exit
	install -Dm 755 "za" "$pkgdir/usr/bin/za"
	install -Dm 644 "za.1" "$pkgdir/usr/share/man/man1/za.1"
}
