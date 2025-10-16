# Maintainer: Shohei Maruyama <cheat.sc.linux@outlook.com>

pkgname='kwin-scripts-kzones'
pkgver=0.9.1
pkgrel=1
pkgdesc='KDE KWin Script for snapping windows into zones'
arch=('any')
url='https://github.com/gerritdevriese/kzones'
license=('GPL-3.0-only')
depends=('kwin')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/gerritdevriese/kzones/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('da8313d46df76f2ee779fd2b9bb373a89c8729917f51c1434fdcd9e848988b2b')

package() {
	cd "kzones-${pkgver}"

	install -d "${pkgdir}/usr/share/kwin/scripts/kzones"
	cp -r src/{contents,metadata.json} "${pkgdir}/usr/share/kwin/scripts/kzones"
	install -Dm644 LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"
}
