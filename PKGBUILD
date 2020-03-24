# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=kvantum-theme-vimix-git
_gitname=vimix-kde
pkgver=r15.b064184
pkgrel=1
pkgdesc="Vimix theme for Kvantum"
arch=('any')
url="https://github.com/vinceliuice/vimix-kde"
license=('GPL3')
depends=('kvantum-qt5')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}" 'vimix-kde')
_commit='b0641848452c4293a8102d5fae93b34b4ae2e013'
source=("git+https://github.com/vinceliuice/vimix-kde.git#commit=$_commit")
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/$_gitname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "$srcdir/$_gitname"
	install -d "$pkgdir/usr/share"
	cp -r Kvantum "$pkgdir/usr/share"
}

