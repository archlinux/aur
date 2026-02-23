# Maintainer: Shohei Maruyama <cheat.sc.linux@outlook.com>

pkgname='kwin-scripts-kzones'
pkgver=0.9.2
pkgrel=1
pkgdesc='KDE KWin Script for snapping windows into zones'
arch=('any')
url='https://github.com/gerritdevriese/kzones'
license=('GPL-3.0-only')
depends=('kwin')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/gerritdevriese/kzones/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('93387df799641fd7a4bbee036a8bd76a9aa065002c44a2c8e2497305e1b20108')

package() {
	cd "kzones-${pkgver}"

	install -d "${pkgdir}/usr/share/kwin/scripts/kzones"
	cp -r src/{contents,metadata.json} "${pkgdir}/usr/share/kwin/scripts/kzones"
	install -Dm644 LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"
}
