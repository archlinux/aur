# Maintainer: PeggyFromIT <peggyfromit at gmail dot com>

pkgname=kvantum-theme-libadwaita-git
_pkgname=KvLibadwaita
pkgver=r12.4f52b42
pkgrel=1
pkgdesc="Libaidwaita theme for Kvantum"
arch=('any')
url="https://github.com/GabePoel/$_pkgname"
license=('GPL3')
makedepends=('git')
depends=('kvantum')
provides=("libaidwaita-kvantum")
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/$_pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd $_pkgname/src
    install -d "$pkgdir"/usr/share/Kvantum/
    cp -r $_pkgname "$pkgdir"/usr/share/Kvantum
}

