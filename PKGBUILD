# Maintainer: Aaron Tinio <aptinio at gmail dot com>
pkgname=chruby-git
pkgver=0.3.9.r31.172685a
pkgrel=1
pkgdesc="Changes the current Ruby."
arch=('any')
url="https://github.com/postmodern/${pkgname%-git}"
license=('MIT')
depends=('bash>=3')
makedepends=('git')
optdepends=('zsh')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("git+$url")
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "%s" "$(git describe --long | sed 's/^v//;s/\([^-]*-\)g/r\1/;s/-/./g')"
}

package() {
	cd "$srcdir/${pkgname%-git}"
	make DESTDIR="$pkgdir/" PREFIX=/usr install
}
