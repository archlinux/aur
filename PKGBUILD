# Maintainer: Anchorman <soulanchor at protonmail dot com>
pkgname=soulanchor
pkgver=0.9.1
pkgrel=1
pkgdesc="X11 Bible tool"
arch=('x86_64')
url="https://github.com/Anchorm/SoulAnchor"
license=('GPL3')
depends=(qt5-base qt5-multimedia)
source=("https://github.com/Anchorm/SoulAnchor/archive/${pkgname}-${pkgver}.tar.gz")
sha256sums=("ac7e1170ebf4e67ff8b6472b1a6030f828f1be1807e843e88ae7953c8d302c81")

build() {
    cd "SoulAnchor-${pkgname}-${pkgver}"
    qmake
    make
}

package() {
	cd "SoulAnchor-${pkgname}-${pkgver}"
	cp -r install/usr/ "${pkgdir}"
	install -Dm644 -t "${pkgdir}/usr/share/doc/soulanchor/" MOD README.md
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/soulanchor/LICENSE"
}
