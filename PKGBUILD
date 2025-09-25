# Maintainer: Simon Templer <st at wetransform dot to>
pkgname=hale-cli-bin
pkgver=6.1.4 # renovate: datasource=github-tags depName=halestudio/hale-cli
pkgrel=1
pkgdesc="Command-line interface for hale studio (binary package)"
arch=('any')
url="https://github.com/halestudio/hale-cli"
license=('LGPL-3.0-only')
depends=('java-runtime')
provides=('hale-cli')
conflicts=('hale-cli' 'hale')
source=("hale-cli_${pkgver}_all.deb::https://github.com/halestudio/hale-cli/releases/download/v${pkgver}/hale-cli_${pkgver}_all.deb")
sha256sums=('d9fd416281adfed6e5257c4e074a58dffc0a70937252d2ae03966cd9f0ed6593')

package() {
	bsdtar -xf "${srcdir}/hale-cli_${pkgver}_all.deb" -C "$srcdir"
	bsdtar -xf "$srcdir/data.tar.gz" -C "$pkgdir"
}
