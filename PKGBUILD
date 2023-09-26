# Maintainer: Gerard Ribugent <gerard.ribugent at gmail dot com>

pkgname=nodenv-nvmrc
pkgver=1.0.6
pkgrel=1
pkgdesc='nodenv plugin that detects the node version based on .nvmrc. '
arch=('any')
url='https://github.com/ouchxp/nodenv-nvmrc'
license=('Unknown')
depends=(
	'bash'
)
source=("${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('8381f5d30edd76251bd218db893823c2d0cc82e5b8a29bd03daa1afe6f02d66d')

package() {
	mkdir -p "${pkgdir}/usr/bin" "${pkgdir}/usr/lib/nodenv/hooks" "${pkgdir}/usr/share/${pkgname}"

	cd "${srcdir}/${pkgname}-${pkgver}"
	cp -rv bin node_modules "${pkgdir}/usr/share/${pkgname}"

	cp -rv etc/nodenv.d/* "${pkgdir}/usr/lib/nodenv/hooks"

	ln -s "/usr/share/${pkgname}/bin/nodenv-nvmrc" "${pkgdir}/usr/bin"
}
