# Maintainer: Alexander Bocken <alexander@bocken.org>
pkgname=threadwatcher
pkgver=r3.753749c
pkgrel=1
pkgdesc="Keep a list of 4chan threads to watch over and continually download media from"
arch=(any)
depends=(
	'bash'
	'jq'
	'openssl'
	)
makedepends=('git')
optdepends=(
	'dmenu: display prompts if issues occur'
)
url="https://github.com/AlexBocken/threadwatcher"
license=('AGPL3')
source=('threadwatcher::git+https://github.com/AlexBocken/threadwatcher.git')
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/$pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
package() {
	cd "$srcdir/$pkgname"
	install -Dm755 threadwatcher $pkgdir/usr/bin/threadwatcher
	install -Dm644 LICENSE $pkgdir/usr/share/licenses/${pkgname}/LICENSE
}
