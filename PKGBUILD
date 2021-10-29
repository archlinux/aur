# Maintainer: Sebastian Rutofski <kontakt@sebastian-rutofski.de>


pkgname='cookcli-bin'
_pkgname="${pkgname%-bin}"
arch=('x86_64')
pkgver=0.0.9
pkgrel=1
pkgdesc='CookCLI is provided as a command-line tool to make Cook recipe management easier, and enable automation and scripting workflows for the CookLang ecosystem. Binary'
provides=("${_pkgname}")
conflicts=("${_pkgname}")
url='https://github.com/cooklang/CookCLI'
license=('MIT')

source=("CookCLI_${pkgver}.zip::https://github.com/cooklang/CookCLI/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('1a416cbae21d77fdc15f7c8b237f06f9ed3ec657a8c6f23fff5c74b831f95b4a')

source_x86_64=("CookCLI_${pkgver}_linux_amd64.zip::https://github.com/cooklang/CookCLI/releases/download/v${pkgver}/CookCLI_${pkgver}_linux_amd64.zip")
sha256sums_x86_64=('03b5bc81c16a27715b1cc5127a35f29626ec679d53ddcd438507a6a06ea8c95b')

package() {
	rm -f "${pkgdir}/usr/bin/cook"
    install -Dm755 "${srcdir}/cook" "${pkgdir}/usr/bin/cook"
    install -Dm644 "${srcdir}/CookCLI-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}