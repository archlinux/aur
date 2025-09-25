# Maintainer: Simon Templer <st at wetransform dot to>
pkgname=hale-cli-bin
pkgver=6.1.3 # renovate: datasource=github-tags depName=halestudio/hale-cli
pkgrel=1
pkgdesc="Command-line interface for hale studio (binary package)"
arch=('any')
url="https://github.com/halestudio/hale-cli"
license=('LGPL-3.0-only')
depends=('java-runtime')
provides=('hale-cli')
conflicts=('hale-cli' 'hale')
source=("hale-cli_${pkgver}_all.deb::https://github.com/halestudio/hale-cli/releases/download/v${pkgver}/hale-cli_${pkgver}_all.deb")
sha256sums=('50970848546696ae846f49157152b0c01a43037815f48d0f74bce99e6fdb7c94')

package() {
	bsdtar -xf "${srcdir}/hale-cli_${pkgver}_all.deb" -C "$srcdir"
	bsdtar -xf "$srcdir/data.tar.gz" -C "$pkgdir"
}
