# Maintainer: Aleksander Mietinen <aleksander at mietinen dot net>

pkgname=linenum-git
_pkgbase=linenum
pkgver=r75.c47f9b2
pkgrel=1
pkgdesc="Scripted Local Linux Enumeration & Privilege Escalation Checks."
arch=('any')
url='https://github.com/rebootuser/LinEnum'
license=('MIT')
depends=('bash')
makedepends=('git' 'findutils')

source=("$_pkgbase::git+$url")
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/$_pkgbase" 
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "$srcdir/$_pkgbase" 
	install -Dm755 LinEnum.sh "$pkgdir/usr/share/$_pkgbase/LinEnum.sh"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$_pkgbase/LICENSE"
}
