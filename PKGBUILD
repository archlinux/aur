# Maintainer: Phantasm <phantasm@centrum.cz>
# Contributor: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=kvantum-theme-qogir-git
_gitname=Qogir-kde
pkgver=r104.d9e05c2
pkgrel=1
pkgdesc="Qogir theme for Kvantum"
arch=('any')
url="https://github.com/vinceliuice/Qogir-kde"
license=('GPL3')
depends=('kvantum')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}" 'qogir-kde-theme' 'qogir-kde-theme-git')
source=('git+https://github.com/vinceliuice/Qogir-kde.git')
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
