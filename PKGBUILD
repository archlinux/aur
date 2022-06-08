# Maintainer: Sebastian Rutofski <kontakt@sebastian-rutofski.de>
# Contributor: Sebastian Rutofski <kontakt@sebastian-rutofski.de>

pkgname='cookcli-bin'
_pkgname="${pkgname%-bin}"
arch=('x86_64')
pkgver=0.1.5
pkgrel=1
pkgdesc='CookCLI is provided as a command-line tool to make Cook recipe management easier, and enable automation and scripting workflows for the CookLang ecosystem. Binary'
provides=("${_pkgname}")
conflicts=("${_pkgname}")
url='https://github.com/cooklang/CookCLI'
license=('MIT')
depends=()

source=("CookCLI_${pkgver}.zip::https://github.com/cooklang/CookCLI/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('443441bc7302096a667159df6535aadb655944165315110e0c1103496f1a3f9c')

source_x86_64=("CookCLI_${pkgver}_linux_amd64.zip::https://github.com/cooklang/CookCLI/releases/download/v${pkgver}/CookCLI_${pkgver}_linux_amd64.zip")
sha256sums_x86_64=('2ff6ef1b0e438de63c48af918e1e4ee06346ce9abdd6b8c7f3f26c8b948a4ba7')

package() {
	rm -f "${pkgdir}/usr/bin/cook"
    install -Dm755 "${srcdir}/cook" "${pkgdir}/usr/bin/cook"
    install -Dm644 "${srcdir}/CookCLI-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}