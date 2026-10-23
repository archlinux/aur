# Maintainer: Simon Templer <st at wetransform dot to>
pkgname=hale-cli-bin
pkgver=6.3.2 # renovate: datasource=github-tags depName=halestudio/hale-cli
pkgrel=1
pkgdesc="Command-line interface for hale studio (binary package)"
arch=('any')
url="https://github.com/halestudio/hale-cli"
license=('LGPL-3.0-only')
depends=('java-runtime')
provides=('hale-cli')
conflicts=('hale-cli' 'hale')
source=("hale-cli_${pkgver}_all.deb::https://github.com/halestudio/hale-cli/releases/download/v${pkgver}/hale-cli_${pkgver}_all.deb")
sha256sums=('caa13b414302f07cf5a21d1cacc60f7e3c7682bddeb03c6962dacfb0ad74214d')

package() {
	bsdtar -xf "${srcdir}/hale-cli_${pkgver}_all.deb" -C "$srcdir"
	bsdtar -xf "$srcdir/data.tar.gz" -C "$pkgdir"
}
