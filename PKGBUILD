# Maintainer: AcidHub <acidhub@craft.net.br>

pkgname=nullidentdmod-git
pkgver=20150610.22.c3f0e54
pkgrel=1
pkgdesc="Minimal identd server with customizable userid"
conflicts=('oidentd' 'nullidentd' 'pindetd' 'nullidentdmod')
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
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}


