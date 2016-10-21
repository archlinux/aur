# Maintainer: Giancarlo Razzolini <grazzolini@gmail.com>
pkgname=tinyssh-convert-git
pkgver=r91.c4c839c
pkgrel=3
pkgdesc="converter for ed25519 keys from OpenSSH to TinySSH format"
arch=('x86_64' 'i686')
url="https://github.com/ansemjo/tinyssh-convert"
license=('MIT')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("git+${url}")
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/${pkgname%-git}"
	./build.sh
}

package() {
	cd "$srcdir/${pkgname%-git}"
        install -Dm 755 ${pkgname%-git} "$pkgdir/usr/bin/${pkgname%-git}"
        install -Dm644 LICENSE "$pkgdir/usr/share/licenses/${pkgname%-git}/LICENSE"
}
