# Maintainer: Sebastian Rutofski <kontakt@sebastian-rutofski.de>
# Contributor: Sebastian Rutofski <kontakt@sebastian-rutofski.de>

pkgname='cookcli-bin'
_pkgname="${pkgname%-bin}"
arch=('x86_64')
pkgver=0.1.6
pkgrel=1
pkgdesc='CookCLI is provided as a command-line tool to make Cook recipe management easier, and enable automation and scripting workflows for the CookLang ecosystem. Binary'
provides=("${_pkgname}")
conflicts=("${_pkgname}")
url='https://github.com/cooklang/CookCLI'
license=('MIT')
depends=()

source=("CookCLI_${pkgver}.zip::https://github.com/cooklang/CookCLI/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('0ad919c950dad9375adaceb79a1cfc407a3ac776a8190de2a82fef30a02a5504')

source_x86_64=("CookCLI_${pkgver}_linux_amd64.zip::https://github.com/cooklang/CookCLI/releases/download/v${pkgver}/CookCLI_${pkgver}_linux_amd64.zip")
sha256sums_x86_64=('d0a09f18b9f83003007613eeab97846e741e34d3f7794ed9596da6227927ff3a')

package() {
	rm -f "${pkgdir}/usr/bin/cook"
    install -Dm755 "${srcdir}/cook" "${pkgdir}/usr/bin/cook"
    install -Dm644 "${srcdir}/CookCLI-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}