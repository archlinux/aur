# Maintainer: Vladimir Panteleev <arch-pkg at thecybershadow.net>
# Contributor: Acidhub <contact@acidhub.click>

pkgname=nullidentdmod-git
pkgver=20181120.33.1d810ba
pkgrel=1
pkgdesc="Minimal identd server with customizable userid"
conflicts=('oidentd' 'nullidentd' 'pindetd' 'nullidentdmod')
arch=('any')
makedepends=('git')
url="http://acidhub.click/NullidentdMod/"
license=('GPL')
source=("git+https://github.com/Acidhub/${pkgname%-*}")
sha1sums=('SKIP')

pkgver() {
    cd "${pkgname%-*}"
	echo "$(date +%Y%m%d).$(git rev-list --count master).$(git rev-parse --short master)" 
}

build() {
    cd "${pkgname%-*}"
    make
}

package() {
    cd "${pkgname%-*}"
    make DESTDIR="${pkgdir}" PREFIX=/usr install
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}


