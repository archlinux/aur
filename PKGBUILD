# Maintainer: Sebastian Rutofski <kontakt@sebastian-rutofski.de>

pkgname='cookcli-bin'
_pkgname="${pkgname%-bin}"
arch=('x86_64')
pkgver=0.0.11
pkgrel=1
pkgdesc='CookCLI is provided as a command-line tool to make Cook recipe management easier, and enable automation and scripting workflows for the CookLang ecosystem. Binary'
provides=("${_pkgname}")
conflicts=("${_pkgname}")
url='https://github.com/cooklang/CookCLI'
license=('MIT')
depends=('zlib' 'gcc-libs')

source=("CookCLI_${pkgver}.zip::https://github.com/cooklang/CookCLI/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('7ffa150a4f3b61a9cef6c0f4c8dbe88c9415dd57938c9eefadcbb427f12d77b8')

source_x86_64=("CookCLI_${pkgver}_linux_amd64.zip::https://github.com/cooklang/CookCLI/releases/download/v${pkgver}/CookCLI_${pkgver}_linux_amd64.zip")
sha256sums_x86_64=('1ae508c760cc0409d04d97a5bc5c8aa04aba8fe4b11af3306c324f6456c5fce3')

package() {
	rm -f "${pkgdir}/usr/bin/cook"
    install -Dm755 "${srcdir}/cook" "${pkgdir}/usr/bin/cook"
    install -Dm644 "${srcdir}/CookCLI-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}