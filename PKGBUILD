# Maintainer: April Hall ari@arithefirst.com
pkgname=palettro-bin
pkgver=1.0.0
pkgrel=1
pkgdesc="A package for quickly updating the color scheme of your RICE"
arch=('x86_64')
url="https://github.com/arithefirst/palettro"
license=('GPL3')
depends=()
provides=('palettro')
conflicts=('palettro')
source=("palettro-${pkgver}::https://github.com/arithefirst/palettro/releases/download/v${pkgver}/palettro-linux-x86_64"
        "https://raw.githubusercontent.com/arithefirst/palettro/refs/heads/master/README.md"
        "https://raw.githubusercontent.com/arithefirst/palettro/refs/heads/master/LICENSE")
sha256sums=('41cf04b6ac6418ae489e623d328b270f72c1ebf3fa0beff0aaa3585f00c18067'
            'SKIP'
            'SKIP')

package() {
    # Install the binary
    install -Dm755 "${srcdir}/palettro-${pkgver}" "${pkgdir}/usr/bin/palettro"
    
    # Install documentation (optional)
    install -Dm644 "${srcdir}/README.md" "${pkgdir}/usr/share/doc/palettro/README.md" 2>/dev/null || true
    install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/palettro/LICENSE" 2>/dev/null || true
}