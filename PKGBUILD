# Maintainer: Sebastian Rutofski <kontakt@sebastian-rutofski.de>

pkgname='cookcli-bin'
_pkgname="${pkgname%-bin}"
arch=('x86_64')
pkgver=0.1.3
pkgrel=1
pkgdesc='CookCLI is provided as a command-line tool to make Cook recipe management easier, and enable automation and scripting workflows for the CookLang ecosystem. Binary'
provides=("${_pkgname}")
conflicts=("${_pkgname}")
url='https://github.com/cooklang/CookCLI'
license=('MIT')
depends=()

source=("CookCLI_${pkgver}.zip::https://github.com/cooklang/CookCLI/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('73415872a045a9b217feddf6bd6f32d47776c62746cccefcd9a91cccb648fc2a')

source_x86_64=("CookCLI_${pkgver}_linux_amd64.zip::https://github.com/cooklang/CookCLI/releases/download/v${pkgver}/CookCLI_${pkgver}_linux_amd64.zip")
sha256sums_x86_64=('ba9b2a2656b1b7583106f1bb5a75876b592c6dc5596c8a23aedd25b01c5edd31')

package() {
	rm -f "${pkgdir}/usr/bin/cook"
    install -Dm755 "${srcdir}/cook" "${pkgdir}/usr/bin/cook"
    install -Dm644 "${srcdir}/CookCLI-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}