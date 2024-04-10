# Maintainer: devome <evinedeng@hotmail.com>

pkgname=docker-image-extract-git
pkgver=20230808.224523
pkgrel=1
pkgdesc="Minimal-dependency shell script to pull and extract all files from an image in Docker Hub."
arch=("any")
provides=("${pkgname%-*}")
conflicts=("${pkgname%-*}")
url="https://github.com/jjlin/${pkgname%-*}"
license=("MIT")
makedepends=("git")
source=("git+${url}")
sha256sums=('SKIP')

pkgver() {
    cd "${pkgname%-*}"
    echo "$(git log -1 --format="%cd" --date='format:%Y%m%d.%H%M%S')"
}

package() {
    cd "${pkgname%-*}"
    install -Dm755 "${pkgname%-*}" "${pkgdir}/usr/bin/${pkgname%-*}"
    install -Dm644 README.md       "${pkgdir}/usr/share/doc/${pkgname%-*}/README.md"
    install -Dm644 LICENSE         "${pkgdir}/usr/share/licenses/${pkgname%-*}/LICENSE"
}
