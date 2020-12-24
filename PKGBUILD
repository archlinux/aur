# Maintainer: Aleksander Mietinen <aleksander at mietinen dot net>

pkgbase=linenum
pkgname=linenum-git
pkgver=r75.c47f9b2
pkgrel=1
pkgdesc="Scripted Local Linux Enumeration & Privilege Escalation Checks."
arch=('any')
url='https://github.com/rebootuser/LinEnum'
license=('MIT')
depends=('bash')
makedepends=('git' 'findutils')

source=("$pkgbase::git+$url")
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/$pkgbase" 
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "$srcdir/$pkgbase" 
	install -Dm755 LinEnum.sh "$pkgdir/usr/share/$pkgbase/LinEnum.sh"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgbase/LICENSE"
}
