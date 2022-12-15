# Maintainer: 0xDEADCADE <$(base64 -d<<<MHhkZWFkY2FkZUBwcm90b25tYWlsLmNvbQ==)>
pkgname=shutthefetchup-git
_pkgname=shutthefetchup
pkgver=r1.2cab32f
pkgrel=1
pkgdesc="A minimal fetch tool to tell all users who posts those annoying fetch BS on r/linux to shut the f--- up."
arch=('any')
url="https://github.com/leap0x7b/${_pkgname}"
license=('WTFPL')
provides=("$_pkgname")
conflicts=("$_pkgname")
depends=('bash')
makedepends=('git')
source=("$pkgname::git+${url}.git")
md5sums=('SKIP')

pkgver() {
	cd $pkgname
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd $pkgname
	install -D -m755 "$_pkgname" "$pkgdir/usr/bin/$_pkgname"
	install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
}
