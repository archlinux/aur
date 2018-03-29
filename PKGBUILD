# Maintainer: zenekron <zenekron@gmail.com>
pkgname=konsole-dracula-git
pkgver=r0
pkgrel=1
pkgdesc="Dracula theme for konsole"
arch=("any")
url="https://draculatheme.com/konsole/"
license=("MIT")
depends=("konsole")
makedepends=("git")
provides=("konsole-dracula")
conflicts=("konsole-dracula")
source=("$pkgname::git+https://github.com/dracula/konsole")
md5sums=("SKIP")

pkgver() {
	cd "$srcdir/$pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "$srcdir/$pkgname"
	install -D "Dracula.colorscheme" "$pkgdir/usr/share/konsole/Dracula.colorscheme"
	install -D "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

