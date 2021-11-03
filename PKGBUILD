# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=fish-ssh-agent-git
pkgver=r26.fd70a2a
pkgrel=2
pkgdesc="Fish plugin to automatically start ssh-agent"
arch=('any')
url="https://github.com/danhper/fish-ssh-agent"
license=('unknown')
groups=('fish-plugins')
depends=('fish' 'openssh')
makedepends=('git')
provides=('fish-ssh-agent')
conflicts=('fish-ssh-agent')
source=("$pkgname::git+$url")
md5sums=('SKIP')

pkgver() {
	cd "$pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "$pkgname"
	install -Dm 644 conf.d/*.fish -t "$pkgdir/usr/share/fish/vendor_conf.d/"
	install -Dm 644 functions/*.fish -t "$pkgdir/usr/share/fish/vendor_functions.d/"
	install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
