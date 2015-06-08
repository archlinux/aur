# Maintainet: AcidHub <acidhub@craft.net.br>
pkgname=nullidentdmod-git
pkgver=20150601.21.a31bcf2
pkgrel=1
pkgdesc="Minimal identd server with customizable userid"
conflicts=('oidentd' 'nullidentd' 'pindetd')
arch=('any')
url="http://web.craft.net.br/NullidentdMod/"
license=('GPL')
source=("git+https://github.com/BlackXT/${pkgname%-*}")
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
    install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}


