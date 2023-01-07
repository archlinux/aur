# Maintainer: Adrián Romero <adriik.linux@proton.me>
pkgname=footy-git
_pkgname=footy
pkgver=r81.0608ed5
pkgrel=1
pkgdesc='A simple shell script that displays the latest football scores, fixtures and standings.'
arch=('any')
url='https://github.com/fritzrehde/footy'
license=('MIT')
depends=('jq' 'bash')
makedepends=('git') 
provides=("$_pkgname")
source=("$_pkgname::git+$url.git")
install="$_pkgname.install"
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/$_pkgname"

	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"

}

package() {
	cd "$srcdir/$_pkgname"

	make install INSTALL_DIR="$pkgdir/usr/bin/"
	install -D -m644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
