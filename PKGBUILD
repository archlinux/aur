# Maintainer: Martin Sandsmark <martin.sandsmark@kde.org>

pkgname=asciiquarium-git
pkgver=r12.8bdb7d4
pkgrel=1
pkgdesc="An aquarium/sea animation in ASCII art"
arch=("any")
url="https://github.com/cmatsuoka/asciiquarium"
license=("GPL")
depends=("perl-term-animation")
makedepends=("git")
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("git+https://github.com/cmatsuoka/asciiquarium.git")
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "$srcdir/${pkgname%-git}"
    install -Dm644 "gpl.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm755 "asciiquarium" "${pkgdir}/usr/bin/asciiquarium"
}
